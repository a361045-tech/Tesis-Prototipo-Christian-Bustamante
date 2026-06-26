extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_boton_play_pressed() -> void:
	get_tree().change_scene_to_file("res://EscenasMenu/ElegirMinijuego.tscn")


func _on_boton_puntajes_pressed() -> void:
	get_tree().change_scene_to_file("res://EscenasMenu/elegir_puntaje.tscn")


func _on_boton_salir_pressed() -> void:
	get_tree().quit()
