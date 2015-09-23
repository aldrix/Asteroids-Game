extends Node2D

var time = 0

func _ready():
	get_node("Animacion").play("BitFun")
	set_process(true)

func _process(delta):
	time += delta
	if time > 2.5:
		get_node("/root/global").goto_scene("res://Scenes/Main.xscn")
