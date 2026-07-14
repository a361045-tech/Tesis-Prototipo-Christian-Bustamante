extends Sprite2D

var habitacionActiva = false
var habitacion2Activa = false
var garajeActiva = false
var lavarActiva = false

var habitacionCont = 0
var habitacion2Cont = 0
var garajeCont = 0
var lavarCont = 0

@export var barraEnergia: ProgressBar
@export var habitacion2: Sprite2D
@export var garaje: Sprite2D
@export var cuartoLavar: Sprite2D
@export var gestionBarrasNodo: Node2D
@export var labelNegativo: Label

var valorSumado = 0

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	if habitacionActiva == true:
		gestionBarrasNodo.cambiarBarra(1.5, delta, false, barraEnergia)
	if habitacion2Activa == true:
		gestionBarrasNodo.cambiarBarra(1.5, delta, false, barraEnergia)
	if garajeActiva == true:
		gestionBarrasNodo.cambiarBarra(1.5, delta, false, barraEnergia)
	if lavarActiva == true:
		gestionBarrasNodo.cambiarBarra(1.5, delta, false, barraEnergia)
		
func _on_timer_timeout() -> void:
	habitacionCont += 1
	
	if habitacionCont == 3:
		texture = load("res://TiposDeEnergiaMinijuego/SpritesEnergia/Habitacion luz 3.png")
		habitacionActiva = true
		valorSumado += 1.5
		#gestionBarrasNodo.cambiarLabel(labelVientoFuerte, "Viento debil", Color(0.87, 0.87, 0.87, 1.0))
		gestionBarrasNodo.cambiarFlechas(1.5, true, labelNegativo)
		#print("habitacion encendido", valorSumado)
		
	if habitacionCont == 6:
		texture = load("res://TiposDeEnergiaMinijuego/SpritesEnergia/Habitacion-removebg-preview.png")
		habitacionActiva = false
		habitacionCont = 0
		valorSumado -= 1.5
		gestionBarrasNodo.cambiarFlechas(1.5, false, labelNegativo)
		#print("habitacion apagado", valorSumado)
	


func _on_habitacion_2_timer_timeout() -> void:
	
	habitacion2Cont += 1
	
	if habitacion2Cont == 6:
		habitacion2.texture = load("res://TiposDeEnergiaMinijuego/SpritesEnergia/Habitacion 2 luz 2.png")
		habitacion2Activa = true
		valorSumado += 1.5
		gestionBarrasNodo.cambiarFlechas(1.5, true, labelNegativo)
		
		#print("habitacion2 encendido", valorSumado)
		
	if habitacion2Cont == 9:
		habitacion2.texture = load("res://TiposDeEnergiaMinijuego/SpritesEnergia/Habitacion 2.png")
		habitacion2Activa = false
		habitacion2Cont = 0
		valorSumado -= 1.5
		gestionBarrasNodo.cambiarFlechas(1.5, false, labelNegativo)
		#print("habitacion2 apagado", valorSumado)


func _on_garaje_timer_timeout() -> void:
	garajeCont += 1
	
	if garajeCont == 10:
		garaje.texture = load("res://TiposDeEnergiaMinijuego/SpritesEnergia/Garaje luz.png")
		garajeActiva = true
		valorSumado += 1.5
		gestionBarrasNodo.cambiarFlechas(1.5, true, labelNegativo)
		#print("Garaje encendido", valorSumado)
		
	if garajeCont == 15:
		garaje.texture = load("res://TiposDeEnergiaMinijuego/SpritesEnergia/Garaje.png")
		garajeActiva = false
		garajeCont = 0
		valorSumado -= 1.5
		gestionBarrasNodo.cambiarFlechas(1.5, false, labelNegativo)
		#print("Garaje apagado", valorSumado)


func _on_lavar_timer_timeout() -> void:
	lavarCont += 1
	
	
	if lavarCont == 20:
		cuartoLavar.texture = load("res://TiposDeEnergiaMinijuego/SpritesEnergia/Cuarto de lavar luz.png")
		lavarActiva = true
		valorSumado += 1.5
		gestionBarrasNodo.cambiarFlechas(1.5, true, labelNegativo)
		#print("lavar encendido", valorSumado)
		
	if lavarCont == 25:
		cuartoLavar.texture = load("res://TiposDeEnergiaMinijuego/SpritesEnergia/Cuarto de lavar.png")
		lavarActiva = false
		lavarCont = 0
		valorSumado -= 1.5
		gestionBarrasNodo.cambiarFlechas(1.5, false, labelNegativo)
		#print("lavar apagado", valorSumado)
		
