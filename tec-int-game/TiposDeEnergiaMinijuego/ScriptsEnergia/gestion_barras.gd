extends Node2D

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass

func cambiarBarra(cantidad: float, delta: float, SubirBajar: bool, tipoBarra: ProgressBar ) -> void:
	if SubirBajar == true:
		tipoBarra.value += cantidad * delta
		
	if SubirBajar == false:
		tipoBarra.value -= cantidad * delta

func cambiarLabel(label: Label, texto: String, color: Color) -> void:
	label.text = texto
	label.add_theme_color_override("font_color", color)
