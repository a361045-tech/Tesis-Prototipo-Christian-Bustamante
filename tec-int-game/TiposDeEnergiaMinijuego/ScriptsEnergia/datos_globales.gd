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
	Guardado.load_game()
	usuarios = game_data["Usuarios"]
	print(usuarios)


func _process(delta: float) -> void:
	
	if panelSolarActivo == true or molinoActivo == true or plantaNuclearActivo == true or termoelectricaActivo == true:
		energiaActiva = true
	else:
		energiaActiva = false
	
