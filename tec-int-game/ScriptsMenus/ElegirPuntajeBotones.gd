extends Node2D

@export var botonRegresar: Sprite2D
@export var botonTEP: Sprite2D

var botonRegresarSel = preload("res://UI_Menus/CirculoSalirSeleccionado.png")
var botonRegresarNormal = preload("res://UI_Menus/CirculoSalir.png")
var botonTEP_Sel = preload("res://UI_Menus/RectangleTEP_Seleccionado.png")
var botonTEP_Normal = preload("res://UI_Menus/Rectangle 7.png")

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass
	


func _on_regresar_pressed() -> void:
	Sonidos.audioClickMenu.play()
	Transiciones.cambiarEscena("res://EscenasMenu/MenuPrincipal.tscn")


func _on_tipos_de_energia_pressed() -> void:
	Sonidos.audioClickMenu.play()
	Transiciones.cambiarEscena("res://EscenasMenu/Puntajes.tscn")


func _on_regresar_mouse_entered() -> void:
	Sonidos.audioClickMenu.play()
	botonRegresar.texture = botonRegresarSel


func _on_regresar_mouse_exited() -> void:
	Sonidos.audioClickMenu.play()
	botonRegresar.texture = botonRegresarNormal


func _on_tipos_de_energia_mouse_entered() -> void:
	botonTEP.texture = botonTEP_Sel


func _on_tipos_de_energia_mouse_exited() -> void:
	botonTEP.texture = botonTEP_Normal
