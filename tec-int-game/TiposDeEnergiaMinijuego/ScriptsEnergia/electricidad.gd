extends Line2D

@export var inicio: Vector2 = Vector2(0, 0)
@export var fin: Vector2 = Vector2(300, 0)
@export var segmentos: int = 10        
@export var desviacion: float = 20.0     
@export var velocidad: float = 15.0       

var ruido: FastNoiseLite = FastNoiseLite.new()
var tiempo: float = 0.0

func _ready():
	ruido.noise_type = FastNoiseLite.TYPE_SIMPLEX
	ruido.frequency = 0.1

func _process(delta: float):
	tiempo += delta * velocidad
	generar_rayo()

func generar_rayo():
	clear_points()
	add_point(inicio)
	
	var vector_total = fin - inicio
	var direccion = vector_total.normalized()
	var normal = Vector2(-direccion.y, direccion.x) 
	var distancia_segmento = vector_total.length() / segmentos
	
	for i in range(1, segmentos):
		var punto_base = inicio + (direccion * distancia_segmento * i)
		var factor_ruido = ruido.get_noise_2d(i * 10.0, tiempo) * desviacion
		var punto_final = punto_base + (normal * factor_ruido)
		add_point(punto_final)
		
		
