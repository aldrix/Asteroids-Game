
extends Node2D

var gas_amount  = 1000

func _ready():
	get_node("AnimationPlayer").play("MainTitleEntry")
	get_node("AnimationPlayer").queue("Press_Enter")
	set_process(true)
	
func _process(delta):
	
	if (Input.is_action_pressed("ui_accept")):
		get_node("/root/global").goto_scene("res://Scenes/Niveles/Nivel0.xscn")



