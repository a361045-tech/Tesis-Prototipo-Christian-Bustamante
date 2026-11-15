extends PanelContainer

@export var nombre_label: Label
@export var tiempo_label: Label
@export var calificacion_label: Label
@export var fecha_label: Label


func inicializar(usuario: Dictionary) -> void:

	nombre_label.text = "%s %s %s %s" % [
		usuario["nombre"],
		usuario["apellidoP"],
		usuario["apellidoM"],
		usuario["grupo"]
	]

	tiempo_label.text = usuario["tiempo"]
	calificacion_label.text = "Calificación: " + usuario["calificacion"]
	fecha_label.text = "Fecha: " + usuario["fecha"]
