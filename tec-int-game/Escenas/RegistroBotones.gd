extends Node2D

@onready var registroNombre = $Nombres
@onready var registroAP = $ApellidoPaterno
@onready var registroAM = $ApellidoMaterno
@onready var registroGrupo = $Grupo

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_registrar_boton_pressed() -> void:
	DatosGlobales.nombre = registroNombre.text
	DatosGlobales.apellidoP = registroAP.text
	DatosGlobales.apellidoM = registroAM.text
	DatosGlobales.grupo = registroGrupo.text
	
	get_tree().change_scene_to_file("res://Escenas/Minjuego.tscn")
	
	
	
