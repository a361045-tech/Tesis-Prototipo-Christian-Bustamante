extends Node2D

var calificacion = ""
@export var tiempoLabel: Label
@export var contaminacionLabel: Label
@export var calificacionLabel: Label
@export var guardadoNodo: Node2D
@export var contenedorCalificacion: Sprite2D
@export var botonSalir: Sprite2D
@export var botonRepetir: Sprite2D

var contenedorMejorable = preload("res://UI_Menus/RectangleMejorable.png")
var contenedorBien = preload("res://UI_Menus/RectangleBien.png")
var contenedorGenial = preload("res://UI_Menus/RectangleGenial.png")
var contenedorExcelente = preload("res://UI_Menus/RectangleExcelente.png")

var botonSalirSel = preload("res://UI_Menus/RectangleSalirSel.png")
var botonSalirNormal = preload("res://UI_Menus/RectangleSalirl.png")
var botonRepetirSel = preload("res://UI_Menus/RectangleRepetirSel.png")
var botonRepetirNormal = preload("res://UI_Menus/RectangleRepetir.png")

func _ready() -> void:
	Sonidos.audioMusicaTE.stop()
	Sonidos.audioResultadosTE.play()
	
	var fecha = Time.get_date_string_from_system()
	
	if DatosGlobales.puntaje < 2:
		calificacion = "Mejorable"
		contenedorCalificacion.texture = contenedorMejorable
	elif DatosGlobales.puntaje >= 2 and DatosGlobales.puntaje < 3.0:
		calificacion = "Bien"
		contenedorCalificacion.texture = contenedorBien
	elif DatosGlobales.puntaje >= 3.0 and DatosGlobales.puntaje < 5:
		calificacion = "Genial"
		contenedorCalificacion.texture = contenedorGenial
	elif DatosGlobales.puntaje >=5:
		calificacion = "Excelente"
		contenedorCalificacion.texture = contenedorExcelente
	
	tiempoLabel.text = str(DatosGlobales.diasFinal, "Dias y " , DatosGlobales.horasFinal, ":00 horas")
	contaminacionLabel.text = str(DatosGlobales.contaminacionFinal)
	calificacionLabel.text = str(calificacion)
	
	var nuevoUsuario = {
	"nombre": DatosGlobales.nombre,
	"apellidoP": DatosGlobales.apellidoP,
	"apellidoM": DatosGlobales.apellidoM,
	"grupo": DatosGlobales.grupo,
	"tiempo": str(DatosGlobales.diasFinal) + " días con " + str(DatosGlobales.horasFinal) + " horas",
	"calificacion": calificacion,
	"fecha": fecha
	}
	
	DatosGlobales.usuarios.append(nuevoUsuario)
	DatosGlobales.game_data["Usuarios"] = DatosGlobales.usuarios
	print(DatosGlobales.usuarios)
	guardadoNodo.save_game()
	guardadoNodo.guardar_usuarios_como_imagen()
	
	reiniciarDatos()

   
func _process(delta: float) -> void:
	pass

func reiniciarDatos() -> void:
	DatosGlobales.energiaActiva = false
	DatosGlobales.nivelViento = 1
	DatosGlobales.deDia = true

	DatosGlobales.panelSolarActivo = false
	DatosGlobales.molinoActivo = false
	DatosGlobales.plantaNuclearActivo = false
	DatosGlobales.termoelectricaActivo = false
	
	DatosGlobales.puntaje = 1
	DatosGlobales.horasFinal = 0
	DatosGlobales.diasFinal = 0
	DatosGlobales.contaminacionFinal = 0

	DatosGlobales.candadoMolino = true
	DatosGlobales.candadoNuclear = true
	DatosGlobales.candadoTermo = true

func _on_repetir_boton_pressed() -> void:
	Sonidos.audioClickMenu.play()
	get_tree().change_scene_to_file("res://EscenasMenu/RegistrarUsuario.tscn")


func _on_salir_boton_pressed() -> void:
	Sonidos.audioClickMenu.play()
	get_tree().change_scene_to_file("res://EscenasMenu/MenuPrincipal.tscn")
	


func _on_salir_boton_mouse_entered() -> void:
	botonSalir.texture = botonSalirSel


func _on_salir_boton_mouse_exited() -> void:
	botonSalir.texture = botonSalirNormal


func _on_repetir_boton_mouse_entered() -> void:
	botonRepetir.texture = botonRepetirSel


func _on_repetir_boton_mouse_exited() -> void:
	botonRepetir.texture = botonRepetirNormal
	
