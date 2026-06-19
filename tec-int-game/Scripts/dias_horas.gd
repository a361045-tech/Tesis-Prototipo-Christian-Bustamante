extends Timer

var horas = 6
var horasPuntaje = 0.06
var dias = 1
@onready var sol = $Sol
@onready var luna = $Luna

@export var barraEnergia: ProgressBar
@export var barraContaminacion: ProgressBar

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	if barraContaminacion.value >= 100 or barraEnergia.value == 1:
		DatosGlobales.puntaje = horasPuntaje
		DatosGlobales.horasFinal = horas
		DatosGlobales.diasFinal = dias
		DatosGlobales.contaminacionFinal = barraContaminacion.value
		print(DatosGlobales.puntaje)
		get_tree().change_scene_to_file("res://Escenas/Resultados.tscn")


func _on_timeout() -> void:
	horas += 1
	horasPuntaje += 0.01
	$"../Horas".text = str(horas,":00")
	
	if horas == 24:
		dias += 1
		horasPuntaje = horasPuntaje + (1-0.24)
		$"../DiaNumero".text = str("Dia ", dias)
		horas = 0
		
	if horas == 19:
		sol.visible = false
		luna.visible = true
	
	if horas == 6:
		sol.visible = true
		luna.visible = false
		
	if horas == 14:
		DatosGlobales.nivelViento = 2
		
	if horas == 22:
		DatosGlobales.nivelViento = 1
		
