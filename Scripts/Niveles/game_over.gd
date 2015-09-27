
extends Node2D

var animacion

func _ready():
	animacion = get_node("Animacion")
	animacion.play("OutOfGasEnter")
	animacion.queue("BarraGas")
	set_process(true)
	
func _process(delta):

	if get_node("Retry").is_pressed():
		print("enter")
		get_node("/root/global").retry()
	elif get_node("Exit").is_pressed():
		get_node("/root/global").goto_scene("res://Scenes/Main.xscn")
