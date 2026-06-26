extends Node2D

var dineroActual = 100
@export var labelDinero: Label

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass
	

func cambiar_dinero (valorDinero: int) -> int:
	
	if dineroActual >= valorDinero:
		dineroActual -= valorDinero
		labelDinero.text = str(dineroActual)
		
		if dineroActual < 0:
			dineroActual = 0
			
	return dineroActual
