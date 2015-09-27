
extends Node2D


#Variables para el Gas.
var gas_amount  = 20

#Variables para los textos a mostrar.
#Dialogos
var time = 0
var HUD 
var avatar_eddie = load("res://Sprites/Nave_Thumbnail.png")
var DialogoEddie1 = ["[Eddie]:Nothing is endless. You have a limited amount of gas in every level.\n",
			         "You can see the gas level in the blue gas bar above. If you ran out of gas,","you're over! :(\n\n",
			         "Get to the ship before the gas bar gets empty.\n"]

#Dececta si el astronauta llega a la nave.
var win       = false
var game_over = false

func _ready():
	HUD = get_node("HUD")
	HUD.show_gas_bar(true)
	set_fixed_process(true)
	

func _fixed_process(delta):

	time += delta
	if time > 1.5 and time < 1.6:
		HUD.set_avatar(avatar_eddie)
		HUD.show_dialogue(DialogoEddie1)
	
	if win:
		get_node("/root/global").set("next_level","res://Scenes/Niveles/Nivel2.xscn")
		get_node("/root/global").set("level_score", 2000 + get_node("Astronauta").gas_amount*100)
		get_node("/root/global").set("max_score",3000)
		get_node("/root/global").goto_scene("res://Scenes/Score.xscn")
	if game_over:
		get_node("/root/global").set("previous_level","res://Scenes/Niveles/Nivel1.xscn")
		get_node("/root/global").goto_scene("res://Scenes/GameOver.xscn")
