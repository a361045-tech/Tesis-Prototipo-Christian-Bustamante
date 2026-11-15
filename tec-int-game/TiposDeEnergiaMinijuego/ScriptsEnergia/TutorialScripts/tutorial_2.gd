extends Node2D


func _on_siguiente_pressed() -> void:
	Sonidos.audioClickMenu.play()
	get_tree().change_scene_to_file("res://TiposDeEnergiaMinijuego/EscenasEnergia/tutorial_3.tscn")


func _on_atras_pressed() -> void:
	Sonidos.audioClickMenu.play()
	get_tree().change_scene_to_file("res://TiposDeEnergiaMinijuego/EscenasEnergia/tutorial_1.tscn")


func _on_saltar_pressed() -> void:
	Sonidos.audioClickMenu.play()
	Transiciones.cambiarEscena("res://TiposDeEnergiaMinijuego/EscenasEnergia/Minjuego.tscn")
