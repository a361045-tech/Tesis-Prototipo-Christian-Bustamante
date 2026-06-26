extends Node2D


func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass
	
	



func _on_regresar_pressed() -> void:
	get_tree().change_scene_to_file("res://EscenasMenu/MenuPrincipal.tscn")


func _on_tipos_de_energia_pressed() -> void:
	get_tree().change_scene_to_file("res://EscenasMenu/Puntajes.tscn")
