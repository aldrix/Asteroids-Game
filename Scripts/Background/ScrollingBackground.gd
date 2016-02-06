
extends ParallaxLayer

var currentPos

func _ready():
	set_process(true)
	
func _process(delta):
	#Obtenemos la posicion actual del fondo.
	currentPos   = get_pos()
	#Desplazamos el fondo hacia la izquierda.
	currentPos.x = currentPos.x - 5 * delta
	#Repetimos el fondo infinitamente.
	if int(currentPos.x) == -512:
		currentPos.x = 0
	#Actualizamod la posicion del fondo.
	set_pos(currentPos)


