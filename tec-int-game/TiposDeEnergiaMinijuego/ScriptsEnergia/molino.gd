extends Sprite2D

@export var botonPanel: Button
@export var barraEnergia: ProgressBar
@export var viento: Sprite2D
@export var labelVientoFuerte: Label
@export var labelVientoActivo: Label
@export var gestionDineroNodo: Node2D
@export var gestionBarrasNodo: Node2D
@export var energiaPrimaria: Sprite2D
@export var energiaSecundaria: Sprite2D
@export var labelEPM: Label
@export var labelESM: Label
var rectanguloInvalido = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleInvalido.png")
var rectanguloDesactivado = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleDesactivado.png")
var rectanguloCinetica = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleCinetica.png")
var rectanguloElectrico = preload("res://TiposDeEnergiaMinijuego/SpritesEnergia/UI/RectangleElectricidad.png")

var labelValor = 0
var dineroMolino = 10

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if DatosGlobales.molinoActivo == true:
		if DatosGlobales.nivelViento == 1:
			gestionBarrasNodo.cambiarBarra(0.5, delta, true, barraEnergia)
			viento.visible = false
			labelVientoFuerte.text = "Viento debil"
			
		if DatosGlobales.nivelViento == 2:
			gestionBarrasNodo.cambiarBarra(2, delta, true, barraEnergia) 
			viento.visible = true
			labelVientoFuerte.text = "Viento fuerte"
			


func _on_button_molino_pressed() -> void:
	
	if gestionDineroNodo.dineroActual >= dineroMolino or DatosGlobales.molinoActivo == true:
		
		match(DatosGlobales.molinoActivo):
			true:
				DatosGlobales.molinoActivo = false
				DatosGlobales.energiaActiva = false
				gestionBarrasNodo.cambiarLabel(labelVientoActivo, "Activar", Color(0.0, 0.871, 0.224, 1.0))
				energiaPrimaria.texture = rectanguloDesactivado
				energiaSecundaria.texture = rectanguloDesactivado
				gestionBarrasNodo.cambiarLabel(labelEPM, "Desactivado", Color(0.0, 0.0, 0.0, 1.0))
				gestionBarrasNodo.cambiarLabel(labelESM, "Sin Produccion", Color(0.0, 0.0, 0.0, 1.0))
				
			false:
				if DatosGlobales.energiaActiva == false:
					labelValor = gestionDineroNodo.cambiar_dinero(dineroMolino)
					DatosGlobales.molinoActivo = true
					DatosGlobales.energiaActiva = true
					gestionBarrasNodo.cambiarLabel(labelVientoActivo, "Desactivar", Color(1, 0, 0, 1))
					energiaPrimaria.texture = rectanguloCinetica
					energiaSecundaria.texture = rectanguloElectrico
					gestionBarrasNodo.cambiarLabel(labelEPM, "Energia cinetica", Color(0.0, 0.0, 0.0, 1.0))
					gestionBarrasNodo.cambiarLabel(labelESM, "Energia electrica", Color(0.0, 0.0, 0.0, 1.0))
