
extends Node2D


#Variables para el Gas.
var gas_amount  = 20

#Variables para los textos a mostrar.
#Dialogos
var time = 0
var HUD 
var avatar_eddie  = load("res://Sprites/Nave_Thumbnail.png")
var DialogoEddie1 = ["[Eddie]: We're here to collect 'Khalum'.\n","Khalum is a strange mineral found only in asteroids.\n",
                     "From it, we can extract Potassium. Which is needed to make nutritional","supplements for space stations.\n\n",
                     "That green Khalum crystal over there has over 80% of Potassium. Collect it."]

var DialogoEddie2 = ["[Eddie]: Great job Astro! Collect the rest and lets get out of here."]

#Dececta si el astronauta llega a la nave.
var win       = false
var game_over = false

#Cantidad de khalum recolectado.
var greenKhal_collected = 0

#Valor del khalum.
var greenKhal_value     = 40

func _ready():
	HUD = get_node("HUD")
	HUD.show_gas_bar(true)
	HUD.show_green_khalum(true)
	HUD.set_collected(greenKhal_collected)
	set_process(true)
	
func _process(delta):

	time += delta
	HUD.set_collected(greenKhal_collected)
	
	if time > 1.5 and time < 1.6:
		HUD.set_avatar(avatar_eddie)
		HUD.show_dialogue(DialogoEddie1)
	
	if greenKhal_collected == 1:
		HUD.set_avatar(avatar_eddie)
		HUD.show_dialogue(DialogoEddie2)
		
	if win:
		print("Se recolecto: ",greenKhal_collected," khalums")
		print("Se obtuvieron ",get_node("Astronauta").gas_amount*100," por el gas sobrante")
		print("Se obtuvieron ",greenKhal_collected*greenKhal_value," por el khalum recolectado")
	
		get_node("/root/global").set("next_level","res://Scenes/Niveles/Nivel3.xscn")
		get_node("/root/global").set("level_score", 2000 + get_node("Astronauta").gas_amount*100 + greenKhal_collected*greenKhal_value)
		get_node("/root/global").set("max_score",3000)
		get_node("/root/global").goto_scene("res://Scenes/Score.xscn")
	if game_over:
		get_node("/root/global").set("previous_level","res://Scenes/Niveles/Nivel2.xscn")
		get_node("/root/global").goto_scene("res://Scenes/GameOver.xscn")
