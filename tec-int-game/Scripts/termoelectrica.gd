extends Sprite2D

@onready var botontermo = $ButtonTermo
@onready var barraEnergia = $"../ProgressBarEnergia"
@onready var barraContaminacion = $"../ProgressBarContaminacion"
@onready var barraTermo = $ProgressBarPetrolio

var labelValor = 0
var dineroTermo = 5

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if DatosGlobales.termoelectricaActivo == true and barraTermo.value > 1:
		barraEnergia.value += 3 * delta 
		barraContaminacion.value += 2 * delta 
		barraTermo.value -= 10 * delta
	
	if barraTermo.value == 1:
		$ActivarTermo.text = "Invalido"
		$ActivarTermo.add_theme_color_override("font_color", Color(0.601, 0.601, 0.601, 1.0))
		DatosGlobales.termoelectricaActivo = false

func _on_button_termo_pressed() -> void:
	labelValor = int($"../DineroTotal".text)
	
	if labelValor > dineroTermo or DatosGlobales.termoelectricaActivo== true:
		
		match(DatosGlobales.termoelectricaActivo):
			true:
				if barraTermo.value > 1:
					DatosGlobales.termoelectricaActivo = false
					DatosGlobales.energiaActiva = false
					$ActivarTermo.text = "Activar"
					$ActivarTermo.add_theme_color_override("font_color", Color(0.0, 0.871, 0.224, 1.0))
				
			false:
				if DatosGlobales.energiaActiva == false and barraTermo.value > 1:
					
					DatosGlobales.termoelectricaActivo = true
					labelValor -= dineroTermo
					$ActivarTermo.text = "Desactivar"
					$ActivarTermo.add_theme_color_override("font_color", Color(1, 0, 0, 1))
					
					
					if labelValor < 0:
						labelValor = 0
						
					$"../DineroTotal".text = str(labelValor)
	
