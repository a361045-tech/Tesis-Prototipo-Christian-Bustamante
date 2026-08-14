extends Sprite2D

@onready var barraContaminacion = get_parent()
@export var animador: Node2D

var corazonEntero = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/Corazon-removebg-preview.png")
var corazonDecente = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/Corazon_2-removebg-preview.png")
var corazonBajo = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/Corazon_3-removebg-preview.png")
var corazonMuyBajo = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/Corazon_5-removebg-preview.png")
var corazonMuerto = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/Corazon_6-removebg-preview.png")

var cambioValor = 1
var cambioAnterior = 1

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if barraContaminacion.value < 25:
		texture = corazonEntero
		cambioValor = 1
	if barraContaminacion.value >= 25 and barraContaminacion.value < 50:
		texture = corazonDecente
		cambioValor = 2
	if barraContaminacion.value >= 50 and barraContaminacion.value < 75:
		texture = corazonBajo
		cambioValor = 3
	if barraContaminacion.value > 75 and barraContaminacion.value < 90:
		texture = corazonMuyBajo
		cambioValor = 4
	if barraContaminacion.value > 90:
		texture = corazonMuerto
		cambioValor = 5
	
	if cambioAnterior != cambioValor:
		cambioAnterior = cambioValor
		animador.corazonParpadeo()
		Sonidos.audioCorazon.play()
	
	
