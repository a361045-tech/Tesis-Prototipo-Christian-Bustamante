extends Node2D

@export var contenedor: VBoxContainer
@export var botonSalir: Sprite2D
@export var iconoFiltro: Sprite2D
@export var panelFiltro: Sprite2D
@export var buscador: LineEdit


var botonSalirSel = preload("res://UI_Menus/CirculoSalirSeleccionado.png")
var botonSalirNormal = preload("res://UI_Menus/CirculoSalir.png")

var botonFiltroSel = preload("res://UI_Menus/BaseFiltroSeleccionado.png")
var botonFiltroNormal = preload("res://UI_Menus/BaseFiltro.png")


var escena_usuario = preload(
	"res://TiposDeEnergiaMinijuego/EscenasEnergia/contenedor_usuario.tscn"
)

var filtro_calificacion: String = ""

var orden_recientes: bool = true

var texto_busqueda: String = ""

var botonFiltroActivo: bool = false


func _ready() -> void:

	panelFiltro.visible = false

	iconoFiltro.texture = botonFiltroNormal

	mostrar_usuarios()


func mostrar_usuarios() -> void:


	for hijo in contenedor.get_children():
		hijo.free()


	var usuarios_filtrados = DatosGlobales.usuarios.duplicate()


	if texto_busqueda != "":
		
		var texto = texto_busqueda.to_lower().strip_edges()

		usuarios_filtrados = usuarios_filtrados.filter(
			func(usuario):

				# Crear nombre completo
				var nombre_completo = (
					str(usuario["nombre"]) + " " +
					str(usuario["apellidoP"]) + " " +
					str(usuario["apellidoM"])
				).to_lower()

				# Obtener fecha
				var fecha = str(usuario["fecha"]).to_lower()

				# Buscar tanto en nombre como en fecha
				return (
					nombre_completo.contains(texto)
					or fecha.contains(texto)
				)
		)



	if filtro_calificacion != "":
		
		usuarios_filtrados = usuarios_filtrados.filter(
			func(usuario):
				return usuario["calificacion"] == filtro_calificacion
		)


	if orden_recientes:
		usuarios_filtrados.reverse()


	for usuario in usuarios_filtrados:

		var nuevo = escena_usuario.instantiate()

		nuevo.inicializar(usuario)

		contenedor.add_child(nuevo)


func _on_regresar_pressed() -> void:
	Sonidos.audioClickMenu.play()

	get_tree().change_scene_to_file(
		"res://EscenasMenu/elegir_puntaje.tscn"
	)


func _on_regresar_mouse_entered() -> void:

	botonSalir.texture = botonSalirSel


func _on_regresar_mouse_exited() -> void:

	botonSalir.texture = botonSalirNormal


func _on_button_filtro_mouse_entered() -> void:

	iconoFiltro.texture = botonFiltroSel


func _on_button_filtro_mouse_exited() -> void:

	if botonFiltroActivo:
		iconoFiltro.texture = botonFiltroSel
	else:
		iconoFiltro.texture = botonFiltroNormal


func _on_button_filtro_pressed() -> void:
	Sonidos.audioClickMenu.play()

	if botonFiltroActivo == false:

		botonFiltroActivo = true
		panelFiltro.visible = true
		iconoFiltro.texture = botonFiltroSel

	else:

		botonFiltroActivo = false
		panelFiltro.visible = false
		iconoFiltro.texture = botonFiltroNormal



func _on_button_antiguos_pressed() -> void:
	Sonidos.audioClickMenu.play()

	orden_recientes = false

	mostrar_usuarios()


func _on_button_recientes_pressed() -> void:
	Sonidos.audioClickMenu.play()

	orden_recientes = true

	mostrar_usuarios()
	

func _on_button_mejorable_pressed() -> void:
	Sonidos.audioClickMenu.play()

	filtro_calificacion = "Mejorable"

	mostrar_usuarios()


func _on_button_bien_pressed() -> void:
	Sonidos.audioClickMenu.play()

	filtro_calificacion = "Bien"

	mostrar_usuarios()


func _on_button_genial_pressed() -> void:
	Sonidos.audioClickMenu.play()

	filtro_calificacion = "Genial"

	mostrar_usuarios()


func _on_button_excelente_pressed() -> void:
	Sonidos.audioClickMenu.play()

	filtro_calificacion = "Excelente"

	mostrar_usuarios()


func _on_button_todos_pressed() -> void:
	Sonidos.audioClickMenu.play()

	filtro_calificacion = ""

	mostrar_usuarios()



func _on_line_edit_buscador_text_changed(new_text: String) -> void:
	texto_busqueda = new_text

	mostrar_usuarios()
