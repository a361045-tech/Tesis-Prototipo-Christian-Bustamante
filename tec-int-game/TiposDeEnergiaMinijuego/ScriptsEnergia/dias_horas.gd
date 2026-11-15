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
@export var gestionBarras: Node2D

@export var labelPositivo: Label

@export var candadoMolino: Sprite2D
@export var candadoNuclear: Sprite2D
@export var candadoTermo: Sprite2D

@export var botonMolino: Button
@export var botonNuclear: Button
@export var botonTermo: Button

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	if barraContaminacion.value >= 100 or barraEnergia.value <= 1.5:
		DatosGlobales.puntaje = horasPuntaje
		DatosGlobales.horasFinal = horas
		DatosGlobales.diasFinal = dias
		DatosGlobales.contaminacionFinal = barraContaminacion.value
		#Transiciones.cambiarEscena("res://TiposDeEnergiaMinijuego/EscenasEnergia/Resultados.tscn")
		get_tree().change_scene_to_file("res://TiposDeEnergiaMinijuego/EscenasEnergia/PerdisteMenu.tscn")
		
		if barraContaminacion.value >= 100:
			DatosGlobales.perderContaminacion = true
		else:
			DatosGlobales.perderEnergia = true

func _on_timeout() -> void:
	horas += 1
	horasPuntaje += 0.01
	horasLabel.text = str(horas,":00 hr")
	
	match(horas):
		6:
			animador.cambiarDia(3)
			DatosGlobales.deDia = true
			
		10:
			if DatosGlobales.candadoNuclear == true:
				animador.desbloquearNuclear()
				Sonidos.audioDesbloqueo.play()
			DatosGlobales.candadoNuclear = false
			#candadoNuclear.visible = false
			#botonNuclear.visible = true
			
		16:
			animador.cambiarDia(1)
			
		17:
			DatosGlobales.nivelViento = 2
			animador.vientoLabelParpadeo()
			animador.vientoFuerteParpadeo()
			Sonidos.audioViento.play()
			#candadoMolino.visible = false
			#botonMolino.visible = true
			
			if DatosGlobales.molinoActivo == true:
				gestionBarras.cambiarFlechas(1.5, true, labelPositivo)
		18:
			if DatosGlobales.candadoMolino == true:
				animador.desbloquearMolino()
				Sonidos.audioDesbloqueo.play()
			DatosGlobales.candadoMolino = false
			
		19:
			animador.cambiarDia(2)
			DatosGlobales.deDia = false
			
			if DatosGlobales.panelSolarActivo == true:
				gestionBarras.cambiarFlechas(1, false, labelPositivo)
				
		22:
			DatosGlobales.nivelViento = 1
			animador.vientoLabelParpadeo()
			animador.vientoFuerteParpadeo()
			Sonidos.audioViento.play()
			
			if DatosGlobales.molinoActivo == true:
				gestionBarras.cambiarFlechas(1.5, false, labelPositivo)
		
		24:
			dias += 1
			horasPuntaje = horasPuntaje + (1-0.24)
			diasLabel.text = str("Dia ", dias)
			horas = 0
			animador.diaLabelParpadeo()
			Sonidos.audioCambioDia.play()
			
			if DatosGlobales.candadoTermo == true:
				animador.desbloquearTermo()
				Sonidos.audioDesbloqueo.play()
			DatosGlobales.candadoTermo = false
			#candadoTermo.visible = false
			#botonTermo.visible = true
	
	
		
		
