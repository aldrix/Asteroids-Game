
extends CanvasLayer

####### DECLARACION DE VARIABLES #######
####### SEGUIMIENTO DEL ASTRONAUTA #######
var astro
var gas_astro

#Variables para los textos a mostrar.
var index       = 0
var dialogue_on = false
var text        = [""]
var avatar
var canvas
var label
var button
var greenK

####### BARRA DE GAS #######
var gas_bar
var initial_gas_amount

####### Controles #######
var control_canvas
var up_button
var down_button
var left_button
var right_button


func _ready():

	#Obtenemos los valores iniciales
	astro = get_parent().get_node("Astronauta")
	#Valores para los mensajes en pantalla.
	canvas = get_node("Control")
	label  = get_node("Control/Label")
	avatar = get_node("Control/Avatar")
	button = get_node("Control/Button")
#	greenK = get_node("GreenKhalum")

	gas_bar = get_node("GasBar")
	gas_bar.hide()
	initial_gas_amount = get_parent().gas_amount
	
	## Manejo de los controles.
	control_canvas = get_node("Controls")
	control_canvas.hide()

	up_button    = get_node("Controls/ControlUp")
	down_button  = get_node("Controls/ControlDown")
	left_button  = get_node("Controls/ControlLeft")
	right_button = get_node("Controls/ControlRight")

	canvas.hide()
#	greenK.hide()

	set_process(true)
	set_process_input(true)

func _process(delta):
	gas_astro = astro.gas_amount
	update_gas_bar(gas_astro)
	
	if dialogue_on:
		label.set_text(text[index])
		
	
#Muestra un dialogo en pantalla.
#Dialogue es un arreglo de strings.
func show_dialogue(dialogue):
	canvas.show()
	button.show()
	hide_controls()
	disable_controls()
	dialogue_on = true
	index = 0
	text = dialogue
	
func hide_dialogue():
	canvas.hide()
	button.hide()
	show_controls()
	enable_controls()
	text = [""]
	dialogue_on = false

func set_avatar(image):
	avatar.set_texture(image)
	
####### FUNCIONES PARA LA BARRA DE GAS #######

#Muestra u Oculta la barra de Gass.
func show_gas_bar(boolean):
	if boolean == true:
		gas_bar.show()
	else:
		gas_bar.hide()
		
#Actualiza el estado de la barra de gas
func update_gas_bar(gas_astro):
	var gas_percentage = round((gas_astro * 100)/initial_gas_amount)
	gas_bar.set_value(gas_percentage)

		
#Muestra u oculta el contador de Khalum.
#func show_green_khalum(boolean):
#	if boolean == true:
#		greenK.show()
#	else:
#		greenK.hide()
#		
#Actualizta el visor de Khalum
#func set_collected(collected):
#	greenK.get_node("Collected").set_text(str(collected))

#Funciones para el control de los botones
func show_controls():
	control_canvas.show()

func hide_controls():
	control_canvas.hide()

func disable_controls():
	up_button.set_disabled(true)
	down_button.set_disabled(true)
	left_button.set_disabled(true)
	right_button.set_disabled(true)
	
func enable_controls():
	up_button.set_disabled(false)
	down_button.set_disabled(false)
	left_button.set_disabled(false)
	right_button.set_disabled(false)

#Se hizo esto para que se presionara solo una vez la tecla.
func _input(event):
	if get_node("Control/Button").is_pressed() && !event.is_echo() && event.is_pressed():
		index += 1
		if index == text.size():
			hide_dialogue()