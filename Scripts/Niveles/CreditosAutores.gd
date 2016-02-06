
extends Node2D

var gas_amount  = 1000
var change      = false


func _ready():
	get_node("Animacion").play("Credits")
	set_process(true)
	set_process_input(true)
	
func _process(delta):
	
	if change:
		get_node("/root/global").goto_scene("res://Scenes/Main.xscn")

func _input(event):
	if get_node("Continue").is_pressed() && event.is_pressed() && !event.is_echo():
		change = true