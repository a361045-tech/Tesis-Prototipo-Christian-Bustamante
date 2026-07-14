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
		

func cambiarLabel(objeto: Control, texto: String, color: Color) -> void:
		objeto.text = texto
		objeto.add_theme_color_override("font_color", color)

func cambiarFlechas(cantidadCambio: float, SubirBajar: bool, tipoLabel: Label) -> void:
	var cantidadActual = float(tipoLabel.text)
	
	if SubirBajar == true:
		cantidadActual += cantidadCambio
		tipoLabel.text = str(cantidadActual, "%")
	
	if SubirBajar == false:
		cantidadActual -= cantidadCambio
		tipoLabel.text = str(cantidadActual, "%")
