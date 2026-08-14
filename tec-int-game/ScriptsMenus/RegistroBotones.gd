extends Node2D

@export var registroNombre: LineEdit
@export var registroAP: LineEdit
@export var registroAM: LineEdit
@export var registroGrupo: LineEdit
@export var botonRegistrar: Sprite2D

var botonRegistrarSel = preload("res://UI_Menus/BotonRegistrarRectanguloSel.png")
var botonRegistrarNormal = preload("res://UI_Menus/BotonRegistrarRectangulo.png")

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_registrar_boton_pressed() -> void:
	Sonidos.audioClickMenu.play()
	
	DatosGlobales.nombre = registroNombre.text
	DatosGlobales.apellidoP = registroAP.text
	DatosGlobales.apellidoM = registroAM.text
	DatosGlobales.grupo = registroGrupo.text
	
	get_tree().change_scene_to_file("res://TiposDeEnergiaMinijuego/EscenasEnergia/Minjuego.tscn")


func _on_registrar_boton_mouse_entered() -> void:
	botonRegistrar.texture = botonRegistrarSel


func _on_registrar_boton_mouse_exited() -> void:
	botonRegistrar.texture = botonRegistrarNormal
