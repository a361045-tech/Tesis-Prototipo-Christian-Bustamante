extends Sprite2D

@export var boton: Button
@export var barraEnergia: ProgressBar
@export var label: Label
@export var gestionDineroNodo: Node2D
@export var gestionBarrasNodo: Node2D

var labelValor = 0
var dinero = 10

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass
	#if DatosGlobales.panelSolarActivo == true:
		#gestionBarrasNodo.cambiarBarra(1.5, delta, true, barraEnergia) 
		

func _on_button_pressed() -> void:
	if gestionDineroNodo.dineroActual >= dinero or DatosGlobales.panelSolarActivo == true:
		
		match(DatosGlobales.panelSolarActivo):
			true:
					DatosGlobales.panelSolarActivo = false
					gestionBarrasNodo.cambiarLabel(label, "Activar", Color(0.0, 0.871, 0.224, 1.0))
				
			false:
					labelValor = gestionDineroNodo.cambiar_dinero(dinero)
					if DatosGlobales.energiaActiva == false:
						DatosGlobales.panelSolarActivo = true
						gestionBarrasNodo.cambiarLabel(label, "Desactivar", Color(1, 0, 0, 1))
