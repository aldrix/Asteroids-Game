extends Node2D

#Variables para el Gas.
var gass_amount  = 1000

#Variables para los textos a mostrar.
var text = 1
var time = 0
var index = 0
var canvas
var eddie
var label
var press_space
var bar_pressed = true
var strings = ["Eddie: Hello Astro! I'm Eddie. Your ship's Artificial Intelligence.\nI'll be happy to help you with some things. Let's get started!\n",
			   "Your first objective is to get to the ship.\nToo easy for an experienced astronaut like you!\n",
			   "To move around, use the up, down, left and right keys. Give it a try."]
			
#Dececta si el astronauta llega a la nave.
var win = false

func _ready():

	#Valores para los mensajes en pantalla.
	canvas = get_node("CanvasLayer/Panel")
	label  = get_node("CanvasLayer/Panel/Label")
	eddie  = get_node("CanvasLayer/EddieImage")
	press_space = get_node("CanvasLayer/PressSpaceImage")
	eddie.hide()
	canvas.hide()
	press_space.hide()
	
	set_fixed_process(true)
	set_process_input(true)

func _fixed_process(delta):

	time  += delta
	if time >= 1.5 :
		eddie.show()
		canvas.show()
		press_space.show()
		
	if(bar_pressed and text == 1):
		label.set_text(strings[index])
		index += 1
		bar_pressed = false
		if index == 3:
			text = 0
			time = 0
			press_space.hide()
	if text == 0:
		time += delta
		press_space.hide()
		if time > 10:
			canvas.hide()
			eddie.hide()
			
	#Cuando el astronauta llegue a la nave, mostramos la escena inicial (por ahora)
	if win:
		print("Ganaste!")
		get_node("/root/global").set("next_level","res://Scenes/Nivel0.scn")
		get_node("/root/global").set("level_score",3000)
		get_node("/root/global").goto_scene("res://Scenes/score.scn")
		
		
#Se hizo esto para que se presionara solo una vez la tecla.
func _input(event):
	if event.is_action("ui_space") && event.is_pressed() && !event.is_echo():
		bar_pressed = true
