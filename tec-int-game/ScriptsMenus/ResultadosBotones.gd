extends Node2D

var calificacion = ""
@export var tiempoLabel: Label
@export var contaminacionLabel: Label
@export var calificacionLabel: Label
@export var guardadoNodo: Node2D


func _ready() -> void:
	
	if DatosGlobales.puntaje < 2.5:
		calificacion = "Mejorable"
	elif DatosGlobales.puntaje >= 2.5 and DatosGlobales.puntaje < 4.0:
		calificacion = "Bien"
	elif DatosGlobales.puntaje >= 4.0 and DatosGlobales.puntaje < 6:
		calificacion = "Genial"
	elif DatosGlobales.puntaje >=6:
		calificacion = "Excelente"
	
	tiempoLabel.text = str("Tiempo: ", DatosGlobales.diasFinal, "Dias y " , DatosGlobales.horasFinal, ":00 horas")
	contaminacionLabel.text = str("Contaminacion: ", DatosGlobales.contaminacionFinal)
	calificacionLabel.text = str("Calificacion: ", calificacion)
	
	var nuevoUsuario = [
		DatosGlobales.nombre,
		DatosGlobales.apellidoP,
		DatosGlobales.apellidoM,
		DatosGlobales.grupo,
		calificacion
	]
	
	DatosGlobales.usuarios.append(nuevoUsuario)
	DatosGlobales.game_data["Usuarios"] = DatosGlobales.usuarios
	print(DatosGlobales.usuarios)
	guardadoNodo.save_game()
	guardadoNodo.guardar_usuarios_como_imagen()

   
func _process(delta: float) -> void:
	pass


func _on_repetir_boton_pressed() -> void:
	get_tree().change_scene_to_file("res://EscenasMenu/RegistrarUsuario.tscn")


func _on_salir_boton_pressed() -> void:
	get_tree().change_scene_to_file("res://EscenasMenu/MenuPrincipal.tscn")
	
