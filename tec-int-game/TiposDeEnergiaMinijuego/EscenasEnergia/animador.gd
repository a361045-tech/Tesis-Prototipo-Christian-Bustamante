extends Node2D

@export var animacionDineroLabel: AnimationPlayer
@export var animacionVientoLabel: AnimationPlayer
@export var animacionVientoFuerte: AnimationPlayer
@export var animacionDiaLabel: AnimationPlayer 
@export var animacionCorazonBorde: AnimationPlayer 

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func dineroParpadeo() -> void:
	animacionDineroLabel.play("parpadeo")

func vientoLabelParpadeo() -> void:
	animacionVientoLabel.play("ParpadeoLabelViento")
	
func vientoFuerteParpadeo() -> void:
	animacionVientoFuerte.play("ParpadeoViento")

func diaLabelParpadeo() -> void:
	animacionDiaLabel.play("ParpadeoDiaLabel")

func corazonParpadeo() -> void:
	animacionCorazonBorde.play("CorazonParpadeo")
