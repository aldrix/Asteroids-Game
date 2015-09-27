
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
var press_space  
var greenK

####### BARRA DE GAS #######
var gas_bar
var initial_gas_amount


func _ready():

	#Obtenemos los valores iniciales
	astro = get_parent().get_node("Astronauta")
	#Valores para los mensajes en pantalla.
	canvas = get_node("Control")
	label  = get_node("Control/Label")
	avatar = get_node("Control/Avatar")
	press_space = get_node("Control/Animation")
	greenK = get_node("GreenKhalum")

	gas_bar = get_node("GasBar")
	gas_bar.hide()
	initial_gas_amount = get_parent().gas_amount

	canvas.hide()
	greenK.hide()

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
	press_space.play("PressSpace")
	dialogue_on = true
	index = 0
	text = dialogue
	
func hide_dialogue():
	canvas.hide()
	press_space.stop()
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
func show_green_khalum(boolean):
	if boolean == true:
		greenK.show()
	else:
		greenK.hide()
		
#Actualizta el visor de Khalum
func set_collected(collected):
	greenK.get_node("Collected").set_text(str(collected))
	
#Se hizo esto para que se presionara solo una vez la tecla.
func _input(event):
	if event.is_action("ui_space") && event.is_pressed() && !event.is_echo():
		index += 1
		if index == text.size():
			hide_dialogue()