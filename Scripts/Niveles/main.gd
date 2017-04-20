
extends Node2D

var gas_amount  = 1000
var change      = false
var first_enter  = true

func _ready():
	get_node("Animacion").play("MainTitleEntry")
	get_node("Animacion").queue("Press_Enter")
	set_process(true)
	set_process_input(true)
	
func _process(delta):
	
	if change:
		get_node("/root/global").set("next_level","res://Scenes/Niveles/Nivel1.xscn")
		get_node("/root/global").save_game()
		get_node("/root/global").goto_scene("res://Scenes/Niveles/Nivel1.xscn")

func _input(event):
#	if event.is_action("ui_enter") && event.is_pressed() && !event.is_echo() and first_enter:
#		first_enter = false
#		if get_node("/root/global").check_savegame():
#			get_node("Animacion").play("Continue")
#		else:
#			change = true
	if event.is_action("ui_enter") && event.is_pressed() && !event.is_echo():
		change = true
#	elif event.is_action("ui_space") && event.is_pressed() && !event.is_echo():
#		get_node("/root/global").load_game()