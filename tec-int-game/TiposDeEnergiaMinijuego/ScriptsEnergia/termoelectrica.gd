extends Sprite2D

@export var botontermo: Button
@export var barraEnergia: ProgressBar
@export var barraContaminacion: ProgressBar
@export var barraTermo: ProgressBar
@export var labelTermo: Label
@export var gestionDineroNodo: Node2D
@export var gestionBarrasNodo: Node2D
@export var energiaPrimaria: Sprite2D
@export var energiaSecundaria: Sprite2D
@export var labelEPT: Label
@export var labelEST: Label
var rectanguloInvalido = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleInvalido.png")
var rectanguloDesactivado = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleDesactivado.png")
var rectanguloTermo = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleTermo.png")
var rectanguloElectrico = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleElectricidad.png")

var labelValor = 0
var dineroTermo = 5

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if DatosGlobales.termoelectricaActivo == true and barraTermo.value > 1:
		gestionBarrasNodo.cambiarBarra(3, delta, true, barraEnergia) 
		gestionBarrasNodo.cambiarBarra(6, delta, true, barraContaminacion) 
		gestionBarrasNodo.cambiarBarra(10, delta, false, barraTermo)
	
	if barraTermo.value == 1:
		gestionBarrasNodo.cambiarLabel(labelTermo, "Invalido", Color(0.601, 0.601, 0.601, 1.0))
		DatosGlobales.termoelectricaActivo = false

func _on_button_termo_pressed() -> void:
	
	if gestionDineroNodo.dineroActual >= dineroTermo or DatosGlobales.termoelectricaActivo == true:
		
		match(DatosGlobales.termoelectricaActivo):
			true:
				if barraTermo.value > 1:
					DatosGlobales.termoelectricaActivo = false
					DatosGlobales.energiaActiva = false
					gestionBarrasNodo.cambiarLabel(labelTermo, "Activar", Color(0.0, 0.871, 0.224, 1.0))
					energiaPrimaria.texture = rectanguloDesactivado
					energiaSecundaria.texture = rectanguloDesactivado
					gestionBarrasNodo.cambiarLabel(labelEPT, "Desactivado", Color(0.0, 0.0, 0.0, 1.0))
					gestionBarrasNodo.cambiarLabel(labelEST, "Sin Produccion", Color(0.0, 0.0, 0.0, 1.0))
				
			false:
				if DatosGlobales.energiaActiva == false and barraTermo.value > 1:
					labelValor = gestionDineroNodo.cambiar_dinero(dineroTermo)
					DatosGlobales.termoelectricaActivo = true
					gestionBarrasNodo.cambiarLabel(labelTermo, "Desactivar", Color(1, 0, 0, 1))
					energiaPrimaria.texture = rectanguloTermo
					energiaSecundaria.texture = rectanguloElectrico
					gestionBarrasNodo.cambiarLabel(labelEPT, "Energia solar", Color(0.0, 0.0, 0.0, 1.0))
					gestionBarrasNodo.cambiarLabel(labelEST, "Energia electrica", Color(0.0, 0.0, 0.0, 1.0))
