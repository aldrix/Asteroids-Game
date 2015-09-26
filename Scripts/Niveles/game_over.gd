
extends Node2D

var animacion

func _ready():
	animacion = get_node("Animacion")
	animacion.play("OutOfGasEnter")
	animacion.queue("text")
	set_process(true)
	
func _process(delta):

	if Input.is_action_pressed("ui_accept"):
		print("enter")
		get_node("/root/global").retry()
	elif Input.is_action_pressed("ui_escape"):
		get_node("/root/global").goto_scene("res://Scenes/Main.xscn")
