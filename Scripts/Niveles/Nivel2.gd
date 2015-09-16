
extends Node2D


#Variables para el Gas.
var gass_amount  = 25

#Variables para los textos a mostrar.
#Dialogos
var time = 0
var HUD 
var avatar_eddie  = load("res://Sprites/Nave_Thumbnail.png")
var DialogoEddie1 = ["[Eddie]: Hello."]

#Dececta si el astronauta llega a la nave.
var win = false

#Cantidad de khalum recolectado.
var greenKhal_collected = 0

#Valor del khalum.
var greenKhal_value     = 20

func _ready():
	HUD = get_node("HUD")
	HUD.show_gass_bar(true)
	set_fixed_process(true)
	

func _fixed_process(delta):

	time += delta
	if time > 1.5 and time < 1.6:
		HUD.set_avatar(avatar_eddie)
		HUD.show_dialogue(DialogoEddie1)
	
	if win:
		print("Se recolecto: ",greenKhal_collected," khalums")
		print("Se obtuvieron ",get_node("Astronauta").gass_amount*100," por el gas sobrante")
		print("Se obtuvieron ",greenKhal_collected*greenKhal_value," por el khalum recolectado")
		
		get_node("/root/global").set("next_level","res://Scenes/main.scn")
		get_node("/root/global").set("level_score", 2000 + get_node("Astronauta").gass_amount*100 + greenKhal_collected*greenKhal_value)
		get_node("/root/global").set("max_score",3000)
		get_node("/root/global").goto_scene("res://Scenes/score.scn")

