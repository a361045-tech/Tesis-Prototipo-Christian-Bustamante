extends Sprite2D

@export var botonMolino: Button
@export var barraEnergia: ProgressBar
@export var viento: Sprite2D

@export var labelVientoFuerte: Label
@export var labelVientoActivo: Label

@export var gestionDineroNodo: Node2D
@export var gestionBarrasNodo: Node2D
@export var animador: Node2D

@export var energiaPrimaria: Sprite2D
@export var energiaSecundaria: Sprite2D

@export var labelEPM: Label
@export var labelESM: Label
@export var labelPositivo: Label

@export var electricidadM: Line2D

var rectanguloInvalido = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleInvalido.png")
var rectanguloDesactivado = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleDesactivado.png")
var rectanguloCinetica = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleCinetica.png")
var rectanguloElectrico = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleElectricidad.png")

var labelValor = 0
var dineroMolino = 10
var valorEnergiaVientoFuerte = 2
var valorEnergiaVientoDebil = 0.5
var activoFuerte = 0

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if DatosGlobales.nivelViento == 1:
		viento.visible = false
		gestionBarrasNodo.cambiarLabel(labelVientoFuerte, "Viento debil", Color(0.87, 0.87, 0.87, 1.0))
	
	if DatosGlobales.nivelViento == 2:
		viento.visible = true
		gestionBarrasNodo.cambiarLabel(labelVientoFuerte, "Viento Fuerte", Color(0.87, 0.87, 0.87, 1.0))
	
	if DatosGlobales.molinoActivo == true:
		if DatosGlobales.nivelViento == 1:
			gestionBarrasNodo.cambiarBarra(valorEnergiaVientoDebil, delta, true, barraEnergia)
			
		if DatosGlobales.nivelViento == 2:
			gestionBarrasNodo.cambiarBarra(valorEnergiaVientoFuerte, delta, true, barraEnergia) 


func _on_button_molino_pressed() -> void:
	
	if (gestionDineroNodo.dineroActual >= dineroMolino or DatosGlobales.molinoActivo == true) and DatosGlobales.candadoMolino == false:
		
		match(DatosGlobales.molinoActivo):
			true:
				DatosGlobales.molinoActivo = false
				DatosGlobales.energiaActiva = false
				gestionBarrasNodo.cambiarLabel(botonMolino, "Activar", Color(0.0, 0.871, 0.224, 1.0))
				energiaPrimaria.texture = rectanguloDesactivado
				energiaSecundaria.texture = rectanguloDesactivado
				electricidadM.visible = false
				gestionBarrasNodo.cambiarLabel(labelEPM, "Desactivado", Color(0.0, 0.0, 0.0, 1.0))
				gestionBarrasNodo.cambiarLabel(labelESM, "Sin Produccion", Color(0.0, 0.0, 0.0, 1.0))
				
				if activoFuerte == 1:
					gestionBarrasNodo.cambiarFlechas(valorEnergiaVientoDebil, false, labelPositivo)
					activoFuerte = 0
				if activoFuerte == 2:
					gestionBarrasNodo.cambiarFlechas(valorEnergiaVientoFuerte, false, labelPositivo)
					activoFuerte = 0
				
			false:
				
				if DatosGlobales.energiaActiva == false:
					labelValor = gestionDineroNodo.cambiar_dinero(dineroMolino)
					animador.dineroParpadeo()
					
					DatosGlobales.molinoActivo = true
					DatosGlobales.energiaActiva = true
					electricidadM.visible = true
					gestionBarrasNodo.cambiarLabel(botonMolino, "Desactivar", Color(1, 0, 0, 1))
					energiaPrimaria.texture = rectanguloCinetica
					energiaSecundaria.texture = rectanguloElectrico
					gestionBarrasNodo.cambiarLabel(labelEPM, "Energia cinetica", Color(0.0, 0.0, 0.0, 1.0))
					gestionBarrasNodo.cambiarLabel(labelESM, "Energia electrica", Color(0.0, 0.0, 0.0, 1.0))
					
					if DatosGlobales.nivelViento == 1:
						gestionBarrasNodo.cambiarFlechas(valorEnergiaVientoDebil, true, labelPositivo)
						activoFuerte = 1
					if DatosGlobales.nivelViento == 2:
						gestionBarrasNodo.cambiarFlechas(valorEnergiaVientoFuerte, true, labelPositivo)
						activoFuerte = 2
