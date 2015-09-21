extends Node2D

#Variables para el Gas.
var gas_amount  = 1000

#Dialogos
var time = 0
var HUD 
var avatar_eddie = load("res://Sprites/Nave_Thumbnail.png")
var DialogoEddie1 = ["[Eddie]: Hello Astro! I'm Eddie. Your ship's Artificial Intelligence.\nI'll be happy to help you with some things. Let's get started!\n",
			   	     "Your first objective is to get to the ship.\nToo easy for an experienced astronaut like you!\n",
			         "To move around, use the up, down, left and right keys. Give it a try."]
			
#Dececta si el astronauta llega a la nave.
var win = false

func _ready():
	HUD = get_node("HUD")
	set_fixed_process(true)

func _fixed_process(delta):

	time  += delta
#	if time > 1.5 and time < 1.6:
#		HUD.set_avatar(avatar_eddie)
#		HUD.show_dialogue(DialogoEddie1)
			
	#Cuando el astronauta llegue a la nave pasamos al siguiente nivel.
	if win:
		get_node("/root/global").set("next_level","res://Scenes/Nivel1.scn")
		get_node("/root/global").set("level_score",3000)
		get_node("/root/global").set("max_score",3000)
		get_node("/root/global").goto_scene("res://Scenes/score.scn")
