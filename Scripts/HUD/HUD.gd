
extends CanvasLayer

####### DECLARACION DE VARIABLES #######

####### SEGUIMIENTO DEL ASTRONAUTA #######
var astro
var gas_astro

#Variables para los textos a mostrar.
var text = 1
var time = 0
var canvas
var avatar
var label
var greenK

####### BARRA DE GAS #######
var gas_bar
var initial_gas_amount


var press_space
var bar_pressed = true
var thread = Thread.new()

func _ready():

	#Obtenemos los valores iniciales
	astro = get_parent().get_node("Astronauta")
	#Valores para los mensajes en pantalla.
#	canvas = get_node("DialogueBackground")
#	label  = get_node("Control/Label")
#	avatar = get_node("Avatar")
#	greenK = get_node("GreenKhalum")
#	press_space = get_node("PressSpace")
	gas_bar = get_node("GasBar")
	gas_bar.hide()
	initial_gas_amount = get_parent().gas_amount
	set_process(true)
#	avatar.hide()
#	canvas.hide()
#	press_space.hide()
#	greenK.hide()

#	set_process_input(true)



func _process(delta):
	gas_astro = astro.gas_amount
	update_gas_bar(gas_astro)
	
#Muestra un dialogo en pantalla.
#Dialogue es un arreglo de strings.
#func show_dialogue(dialogue):
#	#Se crea un hilo para procesar los dialogos.
#	thread.start(self,"change_dialogue", dialogue)
#
#func change_dialogue(dialogue):
#	var total = dialogue.size()
#	var index = 0
#	
#	#Mostramos los cuadros.
#	canvas.show()
#	avatar.show()
#	press_space.show()
#	while index <= total:
#		if bar_pressed:
#			if index < total:
#				label.set_text(dialogue[index])
#			bar_pressed = false
#			print(index)
#			index += 1
#	
#	#Colocamos true para el siguiente dialogo
#	bar_pressed = true
#	#Ocultamos los cuadros.
#	canvas.hide()
#	avatar.hide()
#	press_space.hide()
#	get_node("Control").hide()
#		
#func set_avatar(image):
#	avatar.set_texture(image)


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
#	
#Se hizo esto para que se presionara solo una vez la tecla.
#func _input(event):
#	if event.is_action("ui_space") && event.is_pressed() && !event.is_echo():
#		bar_pressed = true
#