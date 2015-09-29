
extends Node2D

var gas_amount  = 1000
var first_enter = true
var change      = false

func _ready():
	get_node("Animacion").play("MainTitleEntry")
	get_node("Animacion").queue("Start")
	set_process_input(true)
	set_process(true)
	
func _process(delta):
	
	if change:
		get_node("/root/global").set("next_level","res://Scenes/Niveles/Nivel0.xscn")
		get_node("/root/global").save_game()
		get_node("/root/global").goto_scene("res://Scenes/Niveles/Nivel0.xscn")

func _input(event):
	if get_node("Button").is_pressed() && event.is_pressed() && !event.is_echo() and first_enter:
		first_enter = false
		if get_node("/root/global").check_savegame():
			get_node("Animacion").play("ContinueGame")
		else:
			change = true
	elif get_node("New Game").is_pressed() && event.is_pressed() && !event.is_echo() and !first_enter:
		change = true
	elif get_node("Continue").is_pressed() && event.is_pressed() && !event.is_echo() and !first_enter:
		get_node("/root/global").load_game()