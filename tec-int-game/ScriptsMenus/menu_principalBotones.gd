extends Node2D

@export var botonSalir: Sprite2D
@export var botonJugar: Sprite2D
@export var botonPuntajes: Sprite2D
@export var circuloJugar: Sprite2D
@export var circuloPuntajes: Sprite2D



var botonSalirSeleccionado = preload("res://UI_Menus/CirculoSalirSeleccionado.png")
var botonSalirNormal = preload("res://UI_Menus/CirculoSalir.png")
var botonJugarSeleccionado = preload("res://UI_Menus/RectanguloJugarSel.png")
var botonJugarNormal = preload("res://UI_Menus/RectanguloJugar.png")
var botonPuntajesSeleccionado = preload("res://UI_Menus/RectanguloPuntajesSel.png")
var botonPuntajesNormal = preload("res://UI_Menus/RectanguloPuntajes.png")
var jugarCirculoSeleccionado = preload("res://UI_Menus/CirculoBotonesSel.png")
var jugarCirculoNormal = preload("res://UI_Menus/CirculoBotones.png")
var puntajesCirculoSeleccionado = preload("res://UI_Menus/CirculoBotonesSelP.png")
var puntajesCirculoNormal = preload("res://UI_Menus/CirculoBotones.png")

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass


func _on_boton_play_pressed() -> void:
	Sonidos.audioClickMenu.play()
	get_tree().change_scene_to_file("res://EscenasMenu/ElegirMinijuego.tscn")


func _on_boton_puntajes_pressed() -> void:
	Sonidos.audioClickMenu.play()
	get_tree().change_scene_to_file("res://EscenasMenu/elegir_puntaje.tscn")


func _on_boton_salir_pressed() -> void:
	Sonidos.audioClickMenu.play()
	get_tree().quit()


func _on_boton_salir_mouse_entered() -> void:
	botonSalir.texture = botonSalirSeleccionado
	

func _on_boton_salir_mouse_exited() -> void:
	botonSalir.texture = botonSalirNormal 


func _on_boton_play_mouse_entered() -> void:
	botonJugar.texture = botonJugarSeleccionado 
	circuloJugar.texture = jugarCirculoSeleccionado


func _on_boton_play_mouse_exited() -> void:
	botonJugar.texture = botonJugarNormal 
	circuloJugar.texture = jugarCirculoNormal

func _on_boton_puntajes_mouse_entered() -> void:
	botonPuntajes.texture = botonPuntajesSeleccionado 
	circuloPuntajes.texture = puntajesCirculoSeleccionado


func _on_boton_puntajes_mouse_exited() -> void:
	botonPuntajes.texture = botonPuntajesNormal 
	circuloPuntajes.texture = puntajesCirculoNormal
