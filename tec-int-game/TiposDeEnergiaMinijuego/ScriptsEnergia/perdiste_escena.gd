extends Node2D

@export var progressbar: ProgressBar
@export var perdisteLabel: Label
@export var energiaIcono: Sprite2D
@export var contaminacionIcono: Sprite2D

func _ready() -> void:
	Sonidos.audioMusicaTE.stop()
	Sonidos.audioResultadosTE.play()
	
	if DatosGlobales.perderEnergia == true:
		progressbar.value = 1.0
		energiaIcono.visible = true
		contaminacionIcono.visible = false
		perdisteLabel.text = "Perdiste por tener 0% de energía"		
	elif DatosGlobales.perderContaminacion == true:
		progressbar.value = 100.0
		contaminacionIcono.visible = true
		energiaIcono.visible = false
		perdisteLabel.text = "Perdiste por tener 100% de contaminación "

func _process(delta: float) -> void:
	pass


func _on_ver_resultados_pressed() -> void:
	Sonidos.audioClickMenu.play()
	Transiciones.cambiarEscena("res://TiposDeEnergiaMinijuego/EscenasEnergia/Resultados.tscn")
