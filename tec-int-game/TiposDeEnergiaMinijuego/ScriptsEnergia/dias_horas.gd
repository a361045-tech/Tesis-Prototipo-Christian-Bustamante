extends Timer

var horas = 6
var horasPuntaje = 0.06
var dias = 1

@export var sol: Sprite2D
@export var luna: Sprite2D
@export var background: Sprite2D 

@export var barraEnergia: ProgressBar
@export var barraContaminacion: ProgressBar

@export var horasLabel: Label
@export var diasLabel: Label

@export var animador: Node2D

@export var candadoMolino: Sprite2D
@export var candadoNuclear: Sprite2D
@export var candadoTermo: Sprite2D

@export var botonMolino: Button
@export var botonNuclear: Button
@export var botonTermo: Button

var bgDia = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/image 34.png")
var bgNoche = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/image 35.png")

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	if barraContaminacion.value >= 100 or barraEnergia.value == 1:
		DatosGlobales.puntaje = horasPuntaje
		DatosGlobales.horasFinal = horas
		DatosGlobales.diasFinal = dias
		DatosGlobales.contaminacionFinal = barraContaminacion.value
		get_tree().change_scene_to_file("res://EscenasMenu/Resultados.tscn")


func _on_timeout() -> void:
	horas += 1
	horasPuntaje += 0.01
	horasLabel.text = str(horas,":00")
	
	match(horas):
		24:
			dias += 1
			horasPuntaje = horasPuntaje + (1-0.24)
			diasLabel.text = str("Dia ", dias)
			horas = 0
			animador.diaLabelParpadeo()
			DatosGlobales.candadoTermo = false
			candadoTermo.visible = false
			botonTermo.visible = true
		19:
			sol.visible = false
			luna.visible = true
			background.texture = bgNoche
		6:
			sol.visible = true
			luna.visible = false
			background.texture = bgDia
		8:
			DatosGlobales.candadoNuclear = false
			candadoNuclear.visible = false
			botonNuclear.visible = true
			
		14:
			DatosGlobales.nivelViento = 2
			animador.vientoLabelParpadeo()
			animador.vientoFuerteParpadeo()
			DatosGlobales.candadoMolino = false
			candadoMolino.visible = false
			botonMolino.visible = true
		22:
			DatosGlobales.nivelViento = 1
			animador.vientoLabelParpadeo()
			animador.vientoFuerteParpadeo()
	
	
		
		
