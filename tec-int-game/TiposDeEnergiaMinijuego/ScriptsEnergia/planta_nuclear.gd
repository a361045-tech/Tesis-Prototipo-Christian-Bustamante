extends Sprite2D

@export var botonNuclear: Button
@export var barraEnergia = ProgressBar
@export var barraContaminacion = ProgressBar
@export var barraUranio = ProgressBar

@export var gestionDineroNodo: Node2D
@export var gestionBarrasNodo: Node2D
@export var animador: Node2D

@export var energiaPrimaria: Sprite2D
@export var energiaSecundaria: Sprite2D
@export var linea1N: Sprite2D
@export var linea2N: Sprite2D

@export var labelEPN: Label
@export var labelESN: Label
@export var labelNuclear: Label
@export var labelPositivo: Label

@export var electricidadN: Line2D

var rectanguloInvalido = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleInvalido.png")
var rectanguloDesactivado = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleDesactivado.png")
var rectanguloNuclear = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleNuclear.png")
var rectanguloElectrico = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleElectricidad.png")


var labelValor = 0
var dineroNuclear = 5
var valorEnergiaNuclear = 2.5

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if DatosGlobales.plantaNuclearActivo == true and barraUranio.value > 1:
		gestionBarrasNodo.cambiarBarra(valorEnergiaNuclear, delta, true, barraEnergia)
		gestionBarrasNodo.cambiarBarra(1, delta, true, barraContaminacion) 
		gestionBarrasNodo.cambiarBarra(2, delta, false, barraUranio)
		DatosGlobales.contaminacionFinal = barraContaminacion.value
	
	if barraUranio.value == 1:
		if DatosGlobales.plantaNuclearActivo == true: 
			electricidadN.visible = false
			energiaPrimaria.texture = rectanguloDesactivado
			energiaSecundaria.texture = rectanguloDesactivado
			gestionBarrasNodo.cambiarLabel(labelEPN, "Desactivado", Color(0.0, 0.0, 0.0, 1.0))
			gestionBarrasNodo.cambiarLabel(labelESN, "Sin producción", Color(0.0, 0.0, 0.0, 1.0))
			linea1N.modulate = Color(0.0, 0.0, 0.0, 1.0)
			linea2N.modulate = Color(0.0, 0.0, 0.0, 1.0)
			gestionBarrasNodo.cambiarFlechas(valorEnergiaNuclear, false, labelPositivo)
		
		gestionBarrasNodo.cambiarLabel(botonNuclear, "Invalido", Color(0.601, 0.601, 0.601, 1.0))
		DatosGlobales.plantaNuclearActivo = false
	elif (DatosGlobales.energiaActiva == true or gestionDineroNodo.dineroActual < dineroNuclear) and DatosGlobales.plantaNuclearActivo == false:
		gestionBarrasNodo.cambiarLabel(botonNuclear, "Activar", Color(0.601, 0.601, 0.601, 1.0))
	elif DatosGlobales.energiaActiva == false and DatosGlobales.plantaNuclearActivo == false:
		gestionBarrasNodo.cambiarLabel(botonNuclear, "Activar", Color(0.0, 0.871, 0.224, 1.0))
		

func _on_button_nuclear_pressed() -> void:
	if  gestionDineroNodo.dineroActual < dineroNuclear:
		animador.SinDinero()
	
	if (gestionDineroNodo.dineroActual >= dineroNuclear or DatosGlobales.plantaNuclearActivo == true) and DatosGlobales.candadoNuclear == false:
		
		match(DatosGlobales.plantaNuclearActivo):
			true:
				if barraUranio.value > 1: 
					Sonidos.audioDesactivarTE.play()
					DatosGlobales.plantaNuclearActivo = false
					energiaPrimaria.texture = rectanguloDesactivado
					energiaSecundaria.texture = rectanguloDesactivado
					electricidadN.visible = false
					gestionBarrasNodo.cambiarLabel(labelEPN, "Desactivado", Color(0.0, 0.0, 0.0, 1.0))
					gestionBarrasNodo.cambiarLabel(labelESN, "Sin producción", Color(0.0, 0.0, 0.0, 1.0))
					linea1N.modulate = Color(0.0, 0.0, 0.0, 1.0)
					linea2N.modulate = Color(0.0, 0.0, 0.0, 1.0)
					gestionBarrasNodo.cambiarFlechas(valorEnergiaNuclear, false, labelPositivo)
					
				
			false:
				if DatosGlobales.energiaActiva == true and barraUranio.value > 1:
					animador.SoloUna()
				elif DatosGlobales.energiaActiva == false and barraUranio.value > 1:
					Sonidos.audioActivarTE.play()
					labelValor = gestionDineroNodo.cambiar_dinero(dineroNuclear)
					animador.dineroParpadeo()
					animador.GastarNuclear()
					
					DatosGlobales.plantaNuclearActivo = true
					gestionBarrasNodo.cambiarLabel(botonNuclear, "Desactivar", Color(1, 0, 0, 1))
					energiaPrimaria.texture = rectanguloNuclear
					energiaSecundaria.texture = rectanguloElectrico
					electricidadN.visible = true
					gestionBarrasNodo.cambiarLabel(labelEPN, "Energía nuclear", Color(0.0, 0.0, 0.0, 1.0))
					gestionBarrasNodo.cambiarLabel(labelESN, "Energía eléctrica", Color(0.0, 0.0, 0.0, 1.0))
					linea1N.modulate = Color(1, 0, 0, 1)
					linea2N.modulate = Color(1, 0, 0, 1)
					gestionBarrasNodo.cambiarFlechas(valorEnergiaNuclear, true, labelPositivo)
