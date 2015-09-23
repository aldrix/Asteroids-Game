extends KinematicBody2D

const ASTRO_SPEED = 2
const GRAVITY = 10.0

var velocity        = Vector2()
var direction_up    = Vector2(0,1)
var direction_down  = Vector2(0,-1)
var direction_left  = Vector2(1,0)
var direction_right = Vector2(-1,0)
var gas_amount = 100

func has_gas(gas_amout):
	if(gas_amount > 0):
		return true
	else:
		return false

func _ready():
	gas_amount  = get_parent().gas_amount
		
	if get_parent().get_name() == "Main":
		get_node("Camera2D").set_limit(0,0)
		get_node("Camera2D").set_limit(1,0)
		get_node("Camera2D").set_limit(2,0)
		get_node("Camera2D").set_limit(3,0)
		
	set_fixed_process(true)

func _fixed_process(delta):

	#Mientras no se presione nada, el astronauta cae.
	velocity.y = delta*GRAVITY
	var motion = velocity
	move(motion)
	
	#El astronauta se mueve en sentido contrario a la tecla presionada.
	if (Input.is_action_pressed("ui_up") and has_gas(gas_amount)):
		move(direction_up*ASTRO_SPEED)
		gas_amount -= delta
	if (Input.is_action_pressed("ui_down") and has_gas(gas_amount)):
		move(direction_down*ASTRO_SPEED)
		gas_amount -= delta
	if (Input.is_action_pressed("ui_left") and has_gas(gas_amount)):
		move(direction_left*ASTRO_SPEED)
		gas_amount -= delta
	if (Input.is_action_pressed("ui_right")and has_gas(gas_amount)):
		move(direction_right*ASTRO_SPEED)
		gas_amount -= delta
	
	if (is_colliding()):
		if (get_collider().get_name() == "Nave"):
			print("Astro llego a la nave! :D");
			get_parent().set("win",true)