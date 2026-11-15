extends Node2D

func _ready() -> void:
	pass


func save_game() -> void:
	var save_file = FileAccess.open(DatosGlobales.save_path, FileAccess.WRITE)
	save_file.store_var(DatosGlobales.game_data)
	save_file = null


func load_game() -> void:
	if FileAccess.file_exists(DatosGlobales.save_path):
		var save_file = FileAccess.open(DatosGlobales.save_path, FileAccess.READ)
		DatosGlobales.game_data = save_file.get_var()
		save_file = null


func guardar_usuarios_como_imagen():

	var v_box = VBoxContainer.new()
	var ancho_imagen = 600
	v_box.custom_minimum_size.x = ancho_imagen

	var max_usuarios: int = 5

	var titulo = Label.new()
	titulo.text = "REGISTRO: ÚLTIMOS %d USUARIOS\n" % max_usuarios
	titulo.autowrap_mode = TextServer.AUTOWRAP_WORD
	v_box.add_child(titulo)

	var lista_completa = DatosGlobales.usuarios
	var lista_filtrada = []

	if lista_completa.size() > max_usuarios:
		lista_filtrada = lista_completa.slice(lista_completa.size() - max_usuarios)
	else:
		lista_filtrada = lista_completa

	for usuario in lista_filtrada:

		if usuario is Dictionary:

			var label_usuario = Label.new()

			label_usuario.text = "Usuario: %s %s %s\nGrupo: %s\nTiempo: %s\nCalificación: %s\nFecha: %s\n" % [
				usuario["nombre"],
				usuario["apellidoP"],
				usuario["apellidoM"],
				usuario["grupo"],
				usuario["tiempo"],
				usuario["calificacion"],
				usuario["fecha"]
			]

			label_usuario.autowrap_mode = TextServer.AUTOWRAP_WORD
			v_box.add_child(label_usuario)

	var viewport = SubViewport.new()
	viewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS

	add_child(viewport)
	viewport.add_child(v_box)

	v_box.force_update_transform()

	var altura_necesaria = v_box.get_combined_minimum_size().y + 20
	viewport.size = Vector2(ancho_imagen, altura_necesaria)

	await RenderingServer.frame_post_draw

	var img: Image = viewport.get_texture().get_image()

	var ruta_guardado = "user://registro_usuarios.png"
	var error = img.save_png(ruta_guardado)

	if error == OK:
		print("Imagen guardada correctamente")
	else:
		print("Error al guardar la imagen: ", error)

	viewport.queue_free()
	
func guardar_usuarios_como_excel() -> void:
	var ruta_documentos = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
	var ruta_guardado = ruta_documentos + "/Registro_TiposDeEnergia_Usuarios.csv"

	if FileAccess.file_exists(ruta_guardado):
		var quitar_solo_lectura = 'attrib -R "' + ruta_guardado + '"'
		OS.execute("cmd.exe", ["/c", quitar_solo_lectura])

	var archivo = FileAccess.open(ruta_guardado, FileAccess.WRITE)

	if archivo == null:
		print("Error al crear/modificar el archivo CSV")
		return

	archivo.store_line("Nombre,Apellido P,Apellido M,Grupo,Tiempo,Calificacion,Fecha")

	for usuario in DatosGlobales.usuarios:
		if usuario is Dictionary:

			var nombre = str(usuario.get("nombre", ""))
			var apellido_p = str(usuario.get("apellidoP", ""))
			var apellido_m = str(usuario.get("apellidoM", ""))
			var grupo = str(usuario.get("grupo", ""))
			var tiempo = str(usuario.get("tiempo", ""))
			var calificacion = str(usuario.get("calificacion", ""))
			var fecha = str(usuario.get("fecha", ""))

			var linea = "\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\"" % [
				nombre.replace("\"", "\"\""),
				apellido_p.replace("\"", "\"\""),
				apellido_m.replace("\"", "\"\""),
				grupo.replace("\"", "\"\""),
				tiempo.replace("\"", "\"\""),
				calificacion.replace("\"", "\"\""),
				fecha.replace("\"", "\"\"")
			]

			archivo.store_line(linea)

	archivo.close()

	var poner_solo_lectura = 'attrib +R "' + ruta_guardado + '"'
	OS.execute("cmd.exe", ["/c", poner_solo_lectura])

	print("Archivo exportado correctamente:")
	print(ruta_guardado)
