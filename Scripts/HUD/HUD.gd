
extends CanvasLayer

#Variables para los textos a mostrar.
var text = 1
var time = 0
var canvas
var avatar
var label
var press_space
var bar_pressed = true
var thread = Thread.new()

func _ready():
	#Valores para los mensajes en pantalla.
	canvas = get_node("DialogueBackground")
	label  = get_node("Control/Label")
	avatar  = get_node("Avatar")
	press_space = get_node("PressSpace")
	get_node("GasBar").hide()
	avatar.hide()
	canvas.hide()
	press_space.hide()

	set_process_input(true)


#Muestra un dialogo en pantalla.
#Dialogue es un arreglo de strings.
func show_dialogue(dialogue):
	#Se crea un hilo para procesar los dialogos.
	thread.start(self,"change_dialogue", dialogue)

func change_dialogue(dialogue):
	var total = dialogue.size()
	var index = 0
	
	#Mostramos los cuadros.
	canvas.show()
	avatar.show()
	press_space.show()
	while index <= total:
		if bar_pressed:
			if index < total:
				label.set_text(dialogue[index])
			bar_pressed = false
			print(index)
			index += 1
	
	#Colocamos true para el siguiente dialogo
	bar_pressed = true
	#Ocultamos los cuadros.
	canvas.hide()
	avatar.hide()
	press_space.hide()
	get_node("Control").hide()
		
func set_avatar(image):
	get_node("Avatar").set_texture(image)

#Muestra u Oculta la barra de Gass.
func show_gass_bar(boolean):
	if boolean == true:
		get_node("GasBar").show()
	else:
		get_node("GasBar").hide()
		
#Se hizo esto para que se presionara solo una vez la tecla.
func _input(event):
	if event.is_action("ui_space") && event.is_pressed() && !event.is_echo():
		bar_pressed = true
