extends Sprite2D

@export var botonPanel: Button
@export var barraEnergia: ProgressBar
@export var dia: Sprite2D
@export var labelPanel: Label
@export var gestionDineroNodo: Node2D
@export var gestionBarrasNodo: Node2D
@export var energiaPrimaria: Sprite2D
@export var energiaSecundaria: Sprite2D
@export var labelEPP: Label
@export var labelESP: Label
var rectanguloInvalido = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleInvalido.png")
var rectanguloDesactivado = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleDesactivado.png")
var rectanguloSolar = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleSolar.png")
var rectanguloElectrico = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleElectricidad.png")

var labelValor = 0
var dineroPanel = 10

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if DatosGlobales.panelSolarActivo == true:
		gestionBarrasNodo.cambiarBarra(1.5, delta, true, barraEnergia) 
		
	if dia.visible == false:
		gestionBarrasNodo.cambiarLabel(labelPanel, "Invalido", Color(0.601, 0.601, 0.601, 1.0))
		DatosGlobales.panelSolarActivo = false
		energiaPrimaria.texture = rectanguloInvalido
		energiaSecundaria.texture = rectanguloDesactivado
		gestionBarrasNodo.cambiarLabel(labelEPP, "Invalido", Color(0.0, 0.0, 0.0, 1.0))
		gestionBarrasNodo.cambiarLabel(labelESP, "Sin Produccion", Color(0.0, 0.0, 0.0, 1.0))
	
	if dia.visible == true and DatosGlobales.panelSolarActivo == false:
		gestionBarrasNodo.cambiarLabel(labelPanel, "Activar", Color(0.0, 0.871, 0.224, 1.0))
		energiaPrimaria.texture = rectanguloDesactivado
		energiaSecundaria.texture = rectanguloDesactivado
		gestionBarrasNodo.cambiarLabel(labelEPP, "Desactivado", Color(0.0, 0.0, 0.0, 1.0))
		gestionBarrasNodo.cambiarLabel(labelESP, "Sin Produccion", Color(0.0, 0.0, 0.0, 1.0))



func _on_button_panel_pressed() -> void:
	
	if gestionDineroNodo.dineroActual >= dineroPanel or DatosGlobales.panelSolarActivo == true:
		
		match(DatosGlobales.panelSolarActivo):
			true:
				if dia.visible == true:
					DatosGlobales.panelSolarActivo = false
					gestionBarrasNodo.cambiarLabel(labelPanel, "Activar", Color(0.0, 0.871, 0.224, 1.0))
					energiaPrimaria.texture = rectanguloDesactivado
					energiaSecundaria.texture = rectanguloDesactivado
					gestionBarrasNodo.cambiarLabel(labelEPP, "Desactivado", Color(0.0, 0.0, 0.0, 1.0))
					gestionBarrasNodo.cambiarLabel(labelESP, "Sin Produccion", Color(0.0, 0.0, 0.0, 1.0))
					
				
			false:
				if dia.visible == true:
					labelValor = gestionDineroNodo.cambiar_dinero(dineroPanel)
					if DatosGlobales.energiaActiva == false:
						DatosGlobales.panelSolarActivo = true
						gestionBarrasNodo.cambiarLabel(labelPanel, "Desactivar", Color(1, 0, 0, 1))
						energiaPrimaria.texture = rectanguloSolar
						energiaSecundaria.texture = rectanguloElectrico
						gestionBarrasNodo.cambiarLabel(labelEPP, "Energia solar", Color(0.0, 0.0, 0.0, 1.0))
						gestionBarrasNodo.cambiarLabel(labelESP, "Energia electrica", Color(0.0, 0.0, 0.0, 1.0))
