extends Sprite2D

@export var botonPanel: Button
@export var barraEnergia: ProgressBar
@export var dia: Sprite2D

@export var gestionDineroNodo: Node2D
@export var gestionBarrasNodo: Node2D
@export var animador: Node2D

@export var energiaPrimaria: Sprite2D
@export var energiaSecundaria: Sprite2D

@export var labelPanel: Label
@export var labelEPP: Label
@export var labelESP: Label
@export var labelPositivo: Label

@export var electricidadP: Line2D



var rectanguloInvalido = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleInvalido.png")
var rectanguloDesactivado = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleDesactivado.png")
var rectanguloSolar = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleSolar.png")
var rectanguloElectrico = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleElectricidad.png")

var labelValor = 0
var dineroPanel = 10
var valorEnergiaPanel = 1.5

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if DatosGlobales.panelSolarActivo == true:
		gestionBarrasNodo.cambiarBarra(valorEnergiaPanel, delta, true, barraEnergia) 
		
	if dia.visible == false:
		gestionBarrasNodo.cambiarLabel(botonPanel, "Invalido", Color(0.601, 0.601, 0.601, 1.0))
		DatosGlobales.panelSolarActivo = false
		energiaPrimaria.texture = rectanguloInvalido
		energiaSecundaria.texture = rectanguloDesactivado
		electricidadP.visible = false
		gestionBarrasNodo.cambiarLabel(labelEPP, "Invalido", Color(0.0, 0.0, 0.0, 1.0))
		gestionBarrasNodo.cambiarLabel(labelESP, "Sin Produccion", Color(0.0, 0.0, 0.0, 1.0))
	
	if dia.visible == true and DatosGlobales.panelSolarActivo == false:
		gestionBarrasNodo.cambiarLabel(botonPanel, "Activar", Color(0.0, 0.871, 0.224, 1.0))
		energiaPrimaria.texture = rectanguloDesactivado
		energiaSecundaria.texture = rectanguloDesactivado
		electricidadP.visible = false
		gestionBarrasNodo.cambiarLabel(labelEPP, "Desactivado", Color(0.0, 0.0, 0.0, 1.0))
		gestionBarrasNodo.cambiarLabel(labelESP, "Sin Produccion", Color(0.0, 0.0, 0.0, 1.0))



func _on_button_panel_pressed() -> void:
	
	if gestionDineroNodo.dineroActual >= dineroPanel or DatosGlobales.panelSolarActivo == true:
		
		match(DatosGlobales.panelSolarActivo):
			true:
				if dia.visible == true:
					DatosGlobales.panelSolarActivo = false
					gestionBarrasNodo.cambiarLabel(botonPanel, "Activar", Color(0.0, 0.871, 0.224, 1.0))
					energiaPrimaria.texture = rectanguloDesactivado
					energiaSecundaria.texture = rectanguloDesactivado
					electricidadP.visible = false
					gestionBarrasNodo.cambiarLabel(labelEPP, "Desactivado", Color(0.0, 0.0, 0.0, 1.0))
					gestionBarrasNodo.cambiarLabel(labelESP, "Sin Produccion", Color(0.0, 0.0, 0.0, 1.0))
					gestionBarrasNodo.cambiarFlechas(valorEnergiaPanel, false, labelPositivo)
					
				
			false:
				if dia.visible == true:
					labelValor = gestionDineroNodo.cambiar_dinero(dineroPanel)
					animador.dineroParpadeo()
					
					if DatosGlobales.energiaActiva == false:
						DatosGlobales.panelSolarActivo = true
						gestionBarrasNodo.cambiarLabel(botonPanel, "Desactivar", Color(1, 0, 0, 1))
						energiaPrimaria.texture = rectanguloSolar
						energiaSecundaria.texture = rectanguloElectrico
						electricidadP.visible = true
						gestionBarrasNodo.cambiarLabel(labelEPP, "Energia solar", Color(0.0, 0.0, 0.0, 1.0))
						gestionBarrasNodo.cambiarLabel(labelESP, "Energia electrica", Color(0.0, 0.0, 0.0, 1.0))
						gestionBarrasNodo.cambiarFlechas(valorEnergiaPanel, true, labelPositivo)
