extends Node2D

@export var animacionDinero: AnimationPlayer
@export var animacionVientoLabel: AnimationPlayer
@export var animacionVientoFuerte: AnimationPlayer
@export var animacionDiaLabel: AnimationPlayer 
@export var animacionCorazonBorde: AnimationPlayer 
@export var animacionCambiarDia: AnimationPlayer
@export var animacionEnergias: AnimationPlayer

func _ready() -> void:
	Sonidos.audioMusicaMenu.stop()
	Sonidos.audioMusicaTE.play()

func _process(delta: float) -> void:
	pass

func dineroParpadeo() -> void:
	animacionDinero.play("parpadeo")

func vientoLabelParpadeo() -> void:
	animacionVientoLabel.play("ParpadeoLabelViento")
	
func vientoFuerteParpadeo() -> void:
	animacionVientoFuerte.play("ParpadeoViento")

func diaLabelParpadeo() -> void:
	animacionDiaLabel.play("ParpadeoDiaLabel")

func corazonParpadeo() -> void:
	animacionCorazonBorde.play("CorazonParpadeo")
	
func SinDinero() -> void:
	animacionDinero.play("Sin dinero")
	
func SoloUna() -> void:
	animacionEnergias.play("SoloUna")
	
func desbloquearMolino() -> void:
	animacionEnergias.play("Molino_Desbloqueo")
	
func desbloquearNuclear() -> void:
	animacionEnergias.play("Nuclear_Desbloqueo")
	
func desbloquearTermo() -> void:
	animacionEnergias.play("Termo_Desbloqueo")

func GastarPanel() -> void:
	animacionDinero.play("Gastar Dinero Panel")
	
func GastarMolino() -> void:
	animacionDinero.play("Gastar Dinero Molino")

func GastarNuclear() -> void:
	animacionDinero.play("Gastar Dinero Nuclear")

func GastarTermo() -> void:
	animacionDinero.play("Gastar Dinero Termo")

func TutorialPanel(activar: bool) -> void:
	if activar == true:
		animacionEnergias.play("Tutorial flecha")
	elif animacionEnergias.current_animation == "Tutorial flecha":
		animacionEnergias.stop()



func cambiarDia(horaDia: int) -> void:
	
	if horaDia == 1:
		animacionCambiarDia.play("Dia a tarde")
	elif horaDia == 2:
		animacionCambiarDia.play("Tarde a noche")
	else:
		animacionCambiarDia.play("Noche a dia")

func activacionesPanel(activar: int) -> void:
	if activar == 1:
		animacionEnergias.play("Panel_Activar")
	elif activar == 2:
		animacionEnergias.play("Panel_Desactivar")
	elif activar == 2:
		animacionEnergias.play("Panel_Invalido_Desactivado")
	
