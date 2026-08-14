extends Node2D

@export var botonRegresar: Sprite2D
@export var botonTE: Sprite2D

var botonRegresarSel = preload("res://UI_Menus/CirculoSalirSeleccionado.png")
var botonRegresarNormal = preload("res://UI_Menus/CirculoSalir.png")
var botonTE_Sel = preload("res://UI_Menus/RectangleTE_Seleccionado.png")
var botonTE_Normal = preload("res://UI_Menus/RectangleTE.png")

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass


func _on_tipos_de_energia_pressed() -> void:
	Sonidos.audioClickMenu.play()
	get_tree().change_scene_to_file("res://EscenasMenu/RegistrarUsuario.tscn")

func _on_regresar_pressed() -> void:
	Sonidos.audioClickMenu.play()
	get_tree().change_scene_to_file("res://EscenasMenu/MenuPrincipal.tscn")


func _on_regresar_mouse_entered() -> void:
	botonRegresar.texture = botonRegresarSel
	

func _on_regresar_mouse_exited() -> void:
	botonRegresar.texture = botonRegresarNormal


func _on_tipos_de_energia_mouse_entered() -> void:
	botonTE.texture = botonTE_Sel


func _on_tipos_de_energia_mouse_exited() -> void:
	botonTE.texture = botonTE_Normal
