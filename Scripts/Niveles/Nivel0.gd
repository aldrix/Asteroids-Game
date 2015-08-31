extends Node2D

var gass_amount  = 1000
var show_gassBar = false
var text = 1
var time = 0
var index = 0
var canvas
var label
var bar_pressed = true
var strings = ["Eddie: Hello Astro! I'm Edddy. Your personal ship's Artificial Intelligence.\nI'll help you with some things to get started.\n",
			   "Your first objetive is to get to the ship.\nToo easy for an experienced astronaut like you.\n",
			   "To move around, use the up, down, left and right keys. Give it a try."]

func _ready():
	canvas = get_node("CanvasLayer/Panel")
	label  = get_node("CanvasLayer/Panel/Label")
	canvas.hide()
	set_fixed_process(true)
	set_process_input(true)

func _fixed_process(delta):

	time  += delta
	if time > 1.5:
		canvas.show()
	
	if(bar_pressed and text == 1):
		label.set_text(strings[index])
		index += 1
		bar_pressed = false
		if index == 3:
			text = 0
			time = 0
	if text == 0:
		time += delta
		if time > 10:
			canvas.hide()
			
#Se hizo esto para que se presionara solo una vez la tecla.
func _input(event):
	if event.is_action("ui_space") && event.is_pressed() && !event.is_echo():
    	bar_pressed = true