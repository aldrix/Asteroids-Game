
extends Node2D

var current_collected

func _ready():	
	# Conectamos el nodo Area2D con la funcion que realizara el conteo.
	# Connect recibe la senal del cuerpo del astronauta cuando toca el khalum.
	get_node("Area2D").connect("body_enter",self,"_collect_blueKhal")

# Funcion que contabiliza el khalum recolectado
func _collect_blueKhal( body ):
	current_collected = get_node("/root/global").blueKhal_collected + 1
	get_node("/root/global").set("blueKhal_collected",current_collected)
	queue_free()
