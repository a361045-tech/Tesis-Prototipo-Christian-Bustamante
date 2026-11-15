extends Node2D

@export var barraEnergia: ProgressBar

@export var energiaBajaN: Sprite2D
@export var energiaMediaN: Sprite2D
@export var energiaAltaN: Sprite2D

@export var energiaBajaP: Sprite2D
@export var energiaMediaP: Sprite2D
@export var energiaAltaP: Sprite2D
@export var energiaMuyBaja: Sprite2D
@export var energiaMediaExtra: Sprite2D
@export var energiaMuyAlta: Sprite2D

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if DatosGlobales.valorHabitacionesSumado == 0:
		energiaBajaN.visible = false
		energiaMediaN.visible = false
		energiaAltaN.visible = false
		
	elif DatosGlobales.valorHabitacionesSumado == 1:
		energiaBajaN.visible = true
		energiaMediaN.visible = false
		energiaAltaN.visible = false
		
	elif DatosGlobales.valorHabitacionesSumado  == 2:
		energiaBajaN.visible = true
		energiaMediaN.visible = true
		energiaAltaN.visible = false
		
	elif DatosGlobales.valorHabitacionesSumado  == 3:
		energiaBajaN.visible = true
		energiaMediaN.visible = true
		energiaAltaN.visible = true
		
	if DatosGlobales.energiaActiva == false:
		energiaMuyBaja.visible = false
		energiaBajaP.visible = false
		energiaMediaP.visible = false
		energiaMediaExtra.visible = false
		energiaAltaP.visible = false
		energiaMuyAlta.visible = false
		
	elif DatosGlobales.molinoActivo == true:
		
		if DatosGlobales.nivelViento == 1:
			energiaMuyBaja.visible = true
			energiaBajaP.visible = false
			energiaMediaP.visible = false
			energiaMediaExtra.visible = false
			energiaAltaP.visible = false
			energiaMuyAlta.visible = false
			
		elif DatosGlobales.nivelViento == 2:
			energiaMuyBaja.visible = false
			energiaBajaP.visible = true
			energiaMediaP.visible = true
			energiaMediaExtra.visible = false
			energiaAltaP.visible = false
			energiaMuyAlta.visible = false
			
	elif DatosGlobales.panelSolarActivo == true:
		energiaMuyBaja.visible = false
		energiaBajaP.visible = true
		energiaMediaP.visible = false
		energiaMediaExtra.visible = false
		energiaAltaP.visible = false
		energiaMuyAlta.visible = false
		print("2")
		
	elif DatosGlobales.plantaNuclearActivo == true:
		energiaMuyBaja.visible = false
		energiaBajaP.visible = true
		energiaMediaP.visible = true
		energiaMediaExtra.visible = true
		energiaAltaP.visible = false
		energiaMuyAlta.visible = false
		
	elif DatosGlobales.termoelectricaActivo == true:
		energiaMuyBaja.visible = false
		energiaBajaP.visible = true
		energiaMediaP.visible = true
		energiaMediaExtra.visible = false
		energiaAltaP.visible = true
		energiaMuyAlta.visible = true

func cambiarBarra(cantidad: float, delta: float, SubirBajar: bool, tipoBarra: ProgressBar ) -> void:
	var style := barraEnergia.get_theme_stylebox("fill")
	
	if SubirBajar == true:
		tipoBarra.value += cantidad * delta
		
	if SubirBajar == false:
		tipoBarra.value -= cantidad * delta

	
	if barraEnergia.value <= 25:
		style.modulate_color = Color(1, 0, 0, 1)
		barraEnergia.add_theme_stylebox_override("fill", style)
	
	if barraEnergia.value > 25 and barraEnergia.value < 50:
		style.modulate_color = Color(1.0, 1, 0.0, 1.0)
		barraEnergia.add_theme_stylebox_override("fill", style)
	
	if barraEnergia.value >= 50:
		style.modulate_color = Color(0.0, 0.783, 1.0, 1.0)
		barraEnergia.add_theme_stylebox_override("fill", style)


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
