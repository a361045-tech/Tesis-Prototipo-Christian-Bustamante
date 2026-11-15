extends Node2D

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass
	

func cambiarEscena(escena) -> void:
	$Fades.play("Fade_In")
	await  $Fades.animation_finished
	
	get_tree().change_scene_to_file(escena)
	
	$Fades.play("Fade_Out")
	await  $Fades.animation_finished
