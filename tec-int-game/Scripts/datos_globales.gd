extends Node2D

var energiaActiva = false
var nivelViento = 1
var usuarios = []

var panelSolarActivo = false
var molinoActivo = false
var plantaNuclearActivo = false
var termoelectricaActivo = false

var puntaje = 1
var horasFinal = 0
var diasFinal = 0
var contaminacionFinal = 0

var nombre = ""
var apellidoP = ""
var apellidoM = ""
var grupo = "" 

var save_path = "user://save_game.dat"

var game_data : Dictionary = {
	"Usuarios" : []
}

func _ready() -> void:
	load_game()
	usuarios = game_data["Usuarios"]


func _process(delta: float) -> void:
	
	if panelSolarActivo == true or molinoActivo == true or plantaNuclearActivo == true or termoelectricaActivo == true:
		energiaActiva = true
	else:
		energiaActiva = false
	
	print(usuarios)

func save_game() -> void:
	var save_file = FileAccess.open(save_path, FileAccess.WRITE)
	
	save_file.store_var(game_data)
	save_file = null
	
func load_game() -> void:
	if FileAccess.file_exists(save_path):
		var save_file = FileAccess.open(save_path, FileAccess.READ)
		
		game_data = save_file.get_var()
		save_file = null
	
