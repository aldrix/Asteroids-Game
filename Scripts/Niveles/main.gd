
extends Node2D

var gas_amount  = 1000
var change      = false

func _ready():
	get_node("AnimationPlayer").play("MainTitleEntry")
	get_node("AnimationPlayer").queue("Start")
	set_process(true)
	set_process_input(true)
	
func _process(delta):
	
	if change:
		get_node("/root/global").goto_scene("res://Scenes/Niveles/Nivel0.xscn")

func _input(event):
	if get_node("Button").is_pressed():
		change = true