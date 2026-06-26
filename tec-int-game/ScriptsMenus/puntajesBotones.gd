extends Node2D

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	$"Usuarios guardados".text = "".join(DatosGlobales.usuarios)


func _on_regresar_pressed() -> void:
	get_tree().change_scene_to_file("res://EscenasMenu/elegir_puntaje.tscn")
