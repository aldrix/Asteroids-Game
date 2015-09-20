
extends Node2D

var gass_amount  = 1000
var show_gassBar = false

func _ready():
	set_process(true)
	
func _process(delta):
	
	if (Input.is_action_pressed("ui_accept")):
		get_node("/root/global").goto_scene("res://Scenes/Nivel0.scn")



