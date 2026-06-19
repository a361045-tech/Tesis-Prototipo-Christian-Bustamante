extends Node2D

var calificacion = ""


func _ready() -> void:
	
	if DatosGlobales.puntaje < 2.5:
		calificacion = "Mejorable"
	elif DatosGlobales.puntaje >= 2.5 and DatosGlobales.puntaje < 4.0:
		calificacion = "Bien"
	elif DatosGlobales.puntaje >= 4.0 and DatosGlobales.puntaje < 6:
		calificacion = "Genial"
	elif DatosGlobales.puntaje >=6:
		calificacion = "Excelente"
	
	$Tiempo.text = str("Tiempo: ", DatosGlobales.diasFinal, "Dias y " , DatosGlobales.horasFinal, ":00 horas")
	$Contaminacion.text = str("Contaminacion: ", DatosGlobales.contaminacionFinal)
	$Calificacion.text = str("Calificacion: ", calificacion)
	
	var nuevoUsuario = [
		DatosGlobales.nombre,
		DatosGlobales.apellidoP,
		DatosGlobales.apellidoM,
		DatosGlobales.grupo,
		calificacion
	]
	
	DatosGlobales.usuarios.append(nuevoUsuario)
	DatosGlobales.game_data["Usuarios"] = DatosGlobales.usuarios
	DatosGlobales.save_game()
	guardar_usuarios_como_imagen()

   
func _process(delta: float) -> void:
	pass


func _on_repetir_boton_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/RegistrarUsuario.tscn")


func _on_salir_boton_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/MenuPrincipal.tscn")
	

func guardar_usuarios_como_imagen():
	
	var v_box = VBoxContainer.new()
	var ancho_imagen = 600
	v_box.custom_minimum_size.x = ancho_imagen
	

	var max_usuarios: int = 2
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
		if usuario.size() >= 5:
			var label_usuario = Label.new()
			label_usuario.text = "Usuario: %s %s %s\nGrupo: %s | Calificación: %s\n" % [
				usuario[0], usuario[1], usuario[2], usuario[3], usuario[4]
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
		print("¡Imagen guardada! Limitada a los últimos usuarios registrados.")
	else:
		print("Error al guardar la imagen: ", error)
	
	viewport.queue_free()
