extends KinematicBody2D

const ASTRO_SPEED = 2
const GRAVITY = 10.0

####### Variables para el movimiento #######
var velocity        = Vector2()
var direction_up    = Vector2(0,1)
var direction_down  = Vector2(0,-1)
var direction_left  = Vector2(1,0)
var direction_right = Vector2(-1,0)
var gas_amount = 100

####### Botones #######
var up_button
var down_button
var left_button
var right_button

func has_gas(gas_amout):
	if(gas_amount > 0):
		return true
	else:
		return false

func _ready():
	
	gas_amount  = get_parent().gas_amount
	set_fixed_process(true)

func _fixed_process(delta):

	#Obtenemos los botones
	up_button    = get_parent().get_node("HUD").up_button
	down_button  = get_parent().get_node("HUD").down_button
	left_button  = get_parent().get_node("HUD").left_button
	right_button = get_parent().get_node("HUD").right_button

	#Mientras no se presione nada, el astronauta cae.
	velocity.y = delta*GRAVITY
	var motion = velocity
	move(motion)
	
	#El astronauta se mueve en sentido contrario a la tecla presionada.
	if (up_button.is_pressed() and has_gas(gas_amount)):
		move(direction_up*ASTRO_SPEED)
		gas_amount -= delta
	if (down_button.is_pressed() and has_gas(gas_amount)):
		move(direction_down*ASTRO_SPEED)
		gas_amount -= delta
	if (left_button.is_pressed() and has_gas(gas_amount)):
		move(direction_left*ASTRO_SPEED)
		gas_amount -= delta
	if (right_button.is_pressed() and has_gas(gas_amount)):
		move(direction_right*ASTRO_SPEED)
		gas_amount -= delta
	
	if (is_colliding()):
		if (get_collider().get_name() == "Nave"):
			get_parent().set("win",true)
	if not(has_gas(gas_amount)):
		get_parent().set("game_over",true)