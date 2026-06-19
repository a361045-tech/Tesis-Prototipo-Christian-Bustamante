extends Sprite2D

@onready var botonNuclear = $ButtonNuclear
@onready var barraEnergia = $"../ProgressBarEnergia"
@onready var barraContaminacion = $"../ProgressBarContaminacion"
@onready var barraUranio = $ProgressBarUranio

var labelValor = 0
var dineroNuclear = 5

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if DatosGlobales.plantaNuclearActivo == true and barraUranio.value > 1:
		barraEnergia.value += 2.5 * delta 
		barraContaminacion.value += 1 * delta 
		barraUranio.value -= 4 * delta
	
	if barraUranio.value == 1:
		$ActivarNuclear.text = "Invalido"
		$ActivarNuclear.add_theme_color_override("font_color", Color(0.601, 0.601, 0.601, 1.0))
		DatosGlobales.plantaNuclearActivo = false
		

func _on_button_nuclear_pressed() -> void:
	labelValor = int($"../DineroTotal".text)
	
	if labelValor > dineroNuclear or DatosGlobales.plantaNuclearActivo == true:
		
		match(DatosGlobales.plantaNuclearActivo):
			true:
				if barraUranio.value > 1: 
					DatosGlobales.plantaNuclearActivo = false
					$ActivarNuclear.text = "Activar"
					$ActivarNuclear.add_theme_color_override("font_color", Color(0.0, 0.871, 0.224, 1.0))
				
			false:
				if DatosGlobales.energiaActiva == false and barraUranio.value > 1:
					
					DatosGlobales.plantaNuclearActivo = true
					labelValor -= dineroNuclear
					$ActivarNuclear.text = "Desactivar"
					$ActivarNuclear.add_theme_color_override("font_color", Color(1, 0, 0, 1))
					
					
					if labelValor < 0:
						labelValor = 0
						
					$"../DineroTotal".text = str(labelValor)
