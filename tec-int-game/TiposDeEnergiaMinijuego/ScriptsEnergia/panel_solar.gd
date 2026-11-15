extends Sprite2D

@export var botonPanel: Button
@export var barraEnergia: ProgressBar
@export var dia: Sprite2D

@export var gestionDineroNodo: Node2D
@export var gestionBarrasNodo: Node2D
@export var animador: Node2D

@export var energiaPrimaria: Sprite2D
@export var energiaSecundaria: Sprite2D
@export var linea1P: Sprite2D
@export var linea2P: Sprite2D

@export var labelPanel: Label
@export var labelEPP: Label
@export var labelESP: Label
@export var labelPositivo: Label

@export var electricidadP: Line2D
@export var flechaTutorial: Sprite2D


var rectanguloInvalido = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleInvalido.png")
var rectanguloDesactivado = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleDesactivado.png")
var rectanguloSolar = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleSolar.png")
var rectanguloElectrico = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleElectricidad.png")

var labelValor = 0
var dineroPanel = 10
var valorEnergiaPanel = 1

func _ready() -> void:
	animador.TutorialPanel(true)

func _process(delta: float) -> void:
	if DatosGlobales.panelSolarActivo == true:
		gestionBarrasNodo.cambiarBarra(valorEnergiaPanel, delta, true, barraEnergia) 
		
	if DatosGlobales.deDia == false:
		gestionBarrasNodo.cambiarLabel(botonPanel, "Invalido", Color(0.601, 0.601, 0.601, 1.0))
		DatosGlobales.panelSolarActivo = false
		energiaPrimaria.texture = rectanguloInvalido
		energiaSecundaria.texture = rectanguloDesactivado
		electricidadP.visible = false
		#animador.activacionesPanel(3)
		gestionBarrasNodo.cambiarLabel(labelEPP, "Invalido", Color(0.0, 0.0, 0.0, 1.0))
		gestionBarrasNodo.cambiarLabel(labelESP, "Sin Produccion", Color(0.0, 0.0, 0.0, 1.0))
		linea1P.modulate = Color(0.0, 0.0, 0.0, 1.0)
		linea2P.modulate = Color(0.0, 0.0, 0.0, 1.0)
		
	elif (DatosGlobales.energiaActiva == true or gestionDineroNodo.dineroActual < dineroPanel) and DatosGlobales.panelSolarActivo == false:
		gestionBarrasNodo.cambiarLabel(botonPanel, "Activar", Color(0.601, 0.601, 0.601, 1.0))
		
	elif DatosGlobales.deDia == true and DatosGlobales.panelSolarActivo == false:
		gestionBarrasNodo.cambiarLabel(botonPanel, "Activar", Color(0.0, 0.871, 0.224, 1.0))
		energiaPrimaria.texture = rectanguloDesactivado
		energiaSecundaria.texture = rectanguloDesactivado
		electricidadP.visible = false
		gestionBarrasNodo.cambiarLabel(labelEPP, "Desactivado", Color(0.0, 0.0, 0.0, 1.0))
		gestionBarrasNodo.cambiarLabel(labelESP, "Sin Produccion", Color(0.0, 0.0, 0.0, 1.0))
		linea1P.modulate = Color(0.0, 0.0, 0.0, 1.0)
		linea2P.modulate = Color(0.0, 0.0, 0.0, 1.0)
		
	


func _on_button_panel_pressed() -> void:
	if  gestionDineroNodo.dineroActual < dineroPanel:
		animador.SinDinero()
	if gestionDineroNodo.dineroActual >= dineroPanel or DatosGlobales.panelSolarActivo == true:
		
		match(DatosGlobales.panelSolarActivo):
			true:
				if DatosGlobales.deDia == true:
					Sonidos.audioDesactivarTE.play()
					DatosGlobales.panelSolarActivo = false
					#animador.activacionesPanel(2)
					energiaPrimaria.texture = rectanguloDesactivado
					energiaSecundaria.texture = rectanguloDesactivado
					electricidadP.visible = false
					gestionBarrasNodo.cambiarLabel(labelEPP, "Desactivado", Color(0.0, 0.0, 0.0, 1.0))
					gestionBarrasNodo.cambiarLabel(labelESP, "Sin producción", Color(0.0, 0.0, 0.0, 1.0))
					gestionBarrasNodo.cambiarFlechas(valorEnergiaPanel, false, labelPositivo)
					
				
			false:
				if DatosGlobales.energiaActiva == true and DatosGlobales.deDia == true:
					animador.SoloUna()
				
				elif DatosGlobales.deDia == true and DatosGlobales.energiaActiva == false:
					Sonidos.audioActivarTE.play()
					labelValor = gestionDineroNodo.cambiar_dinero(dineroPanel)
					animador.dineroParpadeo()
					animador.GastarPanel()
					animador.TutorialPanel(false)
					flechaTutorial.visible = false
					
					if DatosGlobales.energiaActiva == false:
						DatosGlobales.panelSolarActivo = true
						#animador.activacionesPanel(1)
						gestionBarrasNodo.cambiarLabel(botonPanel, "Desactivar", Color(1, 0, 0, 1))
						energiaPrimaria.texture = rectanguloSolar
						energiaSecundaria.texture = rectanguloElectrico
						electricidadP.visible = true
						gestionBarrasNodo.cambiarLabel(labelEPP, "Energía solar", Color(0.0, 0.0, 0.0, 1.0))
						gestionBarrasNodo.cambiarLabel(labelESP, "Energía eléctrica", Color(0.0, 0.0, 0.0, 1.0))
						linea1P.modulate = Color(1, 0, 0, 1)
						linea2P.modulate = Color(1, 0, 0, 1)
						gestionBarrasNodo.cambiarFlechas(valorEnergiaPanel, true, labelPositivo)
		
func cambiar_EPP(cambio: int) -> void:
	if cambio == 1:
		labelEPP.text = "Energía Solar"
	if cambio == 2:
		labelEPP.text = "Desactivado"
	if cambio == 3:
		labelEPP.text = "Invalido"
	
func cambiar_ESP(cambio: int) -> void:
	if cambio == 1:
		labelESP.text = "Energía eléctrica"
	if cambio == 2:
		labelESP.text = "Sin producción"
