extends Node2D

@export var registroNombre: LineEdit
@export var registroAP: LineEdit
@export var registroAM: LineEdit
@export var registroGrupo: LineEdit

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_registrar_boton_pressed() -> void:
	DatosGlobales.nombre = registroNombre.text
	DatosGlobales.apellidoP = registroAP.text
	DatosGlobales.apellidoM = registroAM.text
	DatosGlobales.grupo = registroGrupo.text
	
	get_tree().change_scene_to_file("res://TiposDeEnergiaMinijuego/EscenasEnergia/Minjuego.tscn")
	
	
	
