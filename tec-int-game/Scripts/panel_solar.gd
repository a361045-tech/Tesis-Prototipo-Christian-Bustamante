extends Sprite2D

@onready var botonPanel = $ButtonPanel
@onready var barraEnergia = $"../ProgressBarEnergia"
@onready var dia = $"../DiasHoras/Sol"
var labelValor = 0
var dineroPanel = 10

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if DatosGlobales.panelSolarActivo == true:
		barraEnergia.value += 1.5 * delta 
		
	if dia.visible == false:
		$ActivarPanel.text = "Invalido"
		$ActivarPanel.add_theme_color_override("font_color", Color(0.601, 0.601, 0.601, 1.0))
		DatosGlobales.panelSolarActivo = false
	
	if dia.visible == true and DatosGlobales.panelSolarActivo == false:
		$ActivarPanel.text = "Activar"
		$ActivarPanel.add_theme_color_override("font_color", Color(0.0, 0.871, 0.224, 1.0))



func _on_button_panel_pressed() -> void:
	labelValor = int($"../DineroTotal".text)
	
	if labelValor > dineroPanel or DatosGlobales.panelSolarActivo == true:
		
		match(DatosGlobales.panelSolarActivo):
			true:
				if dia.visible == true:
					DatosGlobales.panelSolarActivo = false
					$ActivarPanel.text = "Activar"
					$ActivarPanel.add_theme_color_override("font_color", Color(0.0, 0.871, 0.224, 1.0))
				
			false:
				if dia.visible == true:
					if DatosGlobales.energiaActiva == false:
						DatosGlobales.panelSolarActivo = true
						labelValor -= dineroPanel
						$ActivarPanel.text = "Desactivar"
						$ActivarPanel.add_theme_color_override("font_color", Color(1, 0, 0, 1))
						if labelValor < 0:
							labelValor = 0
						$"../DineroTotal".text = str(labelValor)
