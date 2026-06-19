extends Sprite2D

var habitacionActiva = false
var habitacion2Activa = false
var garajeActiva = false
var lavarActiva = false

var habitacionCont = 0
var habitacion2Cont = 0
var garajeCont = 0
var lavarCont = 0

@onready var barraEnergia = $"../ProgressBarEnergia"
@onready var habitacion2 = $"../Habitacion2"
@onready var garaje = $"../Garaje"
@onready var cuartoLavar = $"../CuartoDeLavar"

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	if habitacionActiva == true:
		barraEnergia.value -= 1.5 * delta 
	if habitacion2Activa == true:
		barraEnergia.value -= 1.5 * delta 
	if garajeActiva == true:
		barraEnergia.value -= 1.5 * delta 
	if lavarActiva == true:
		barraEnergia.value -= 1.5 * delta 
		
func _on_timer_timeout() -> void:
	habitacionCont += 1
	
	if habitacionCont == 3:
		texture = load("res://Sprites/Habitacion luz 3.png")
		habitacionActiva = true
		
	if habitacionCont == 6:
		texture = load("res://Sprites/Habitacion-removebg-preview.png")
		habitacionActiva = false
		habitacionCont = 0
	


func _on_habitacion_2_timer_timeout() -> void:
	
	habitacion2Cont += 1
	
	if habitacion2Cont == 6:
		habitacion2.texture = load("res://Sprites/Habitacion 2 luz 2.png")
		habitacion2Activa = true
		
	if habitacion2Cont == 9:
		habitacion2.texture = load("res://Sprites/Habitacion 2.png")
		habitacion2Activa = false
		habitacion2Cont = 0


func _on_garaje_timer_timeout() -> void:
	garajeCont += 1
	
	if garajeCont == 10:
		garaje.texture = load("res://Sprites/Garaje luz.png")
		garajeActiva = true
		
	if garajeCont == 15:
		garaje.texture = load("res://Sprites/Garaje.png")
		garajeActiva = false
		garajeCont = 0


func _on_lavar_timer_timeout() -> void:
	lavarCont += 1
	
	if lavarCont == 20:
		cuartoLavar.texture = load("res://Sprites/Cuarto de lavar luz.png")
		lavarActiva = true
		
	if lavarCont == 25:
		cuartoLavar.texture = load("res://Sprites/Cuarto de lavar.png")
		lavarActiva = false
		lavarCont = 0
