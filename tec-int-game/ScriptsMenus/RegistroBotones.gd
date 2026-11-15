extends Node2D

@export var registroNombre: LineEdit
@export var registroAP: LineEdit
@export var registroAM: LineEdit
@export var registroGrupo: LineEdit
@export var botonRegistrar: Sprite2D
@export var animationError: AnimationPlayer

var botonRegistrarSel = preload("res://UI_Menus/BotonRegistrarRectanguloSel.png")
var botonRegistrarNormal = preload("res://UI_Menus/BotonRegistrarRectangulo.png")

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass

func _on_registrar_boton_pressed() -> void:
	Sonidos.audioClickMenu.play()
	
	if registroNombre.text.is_empty() or registroAP.text.is_empty() or registroAM.text.is_empty() or registroGrupo.text.is_empty():
		animationError.play("Faltan Datos")
	else:
		DatosGlobales.nombre = registroNombre.text
		DatosGlobales.apellidoP = registroAP.text
		DatosGlobales.apellidoM = registroAM.text
		DatosGlobales.grupo = registroGrupo.text
		
		Transiciones.cambiarEscena("res://TiposDeEnergiaMinijuego/EscenasEnergia/tutorial_1.tscn")


func _on_registrar_boton_mouse_entered() -> void:
	botonRegistrar.texture = botonRegistrarSel


func _on_registrar_boton_mouse_exited() -> void:
	botonRegistrar.texture = botonRegistrarNormal
