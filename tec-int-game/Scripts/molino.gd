extends Sprite2D

@onready var botonPanel = $ButtonMolino
@onready var barraEnergia = $"../ProgressBarEnergia"
@onready var viento = $"../VientoFuerte"
@onready var labelViento = $"../NivelViento"

var labelValor = 0
var dineroMolino = 10

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if DatosGlobales.molinoActivo == true:
		if DatosGlobales.nivelViento == 1:
			barraEnergia.value += 1 * delta 
			viento.visible = false
			labelViento.text = "Viento debil"
			
		if DatosGlobales.nivelViento == 2:
			barraEnergia.value += 2 * delta 
			viento.visible = true
			labelViento.text = "Viento fuerte"
			


func _on_button_molino_pressed() -> void:
	labelValor = int($"../DineroTotal".text)
	
	if labelValor > dineroMolino or DatosGlobales.molinoActivo == true:
		
		match(DatosGlobales.molinoActivo):
			true:
				DatosGlobales.molinoActivo = false
				DatosGlobales.energiaActiva = false
				$ActivarMolino.text = "Activar"
				$ActivarMolino.add_theme_color_override("font_color", Color(0.0, 0.871, 0.224, 1.0))
				
			false:
				if DatosGlobales.energiaActiva == false:
					
					DatosGlobales.molinoActivo = true
					DatosGlobales.energiaActiva = true
					labelValor -= dineroMolino
					$ActivarMolino.text = "Desactivar"
					$ActivarMolino.add_theme_color_override("font_color", Color(1, 0, 0, 1))
					
					if labelValor < 0:
						labelValor = 0
						
					$"../DineroTotal".text = str(labelValor)
	
