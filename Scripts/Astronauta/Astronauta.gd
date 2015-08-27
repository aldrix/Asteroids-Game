
extends KinematicBody2D

const ASTRO_SPEED = 1.5
const GRAVITY = 15.0

var velocity        = Vector2()
var direction_up    = Vector2(0,1)
var direction_down  = Vector2(0,-1)
var direction_left  = Vector2(1,0)
var direction_right = Vector2(-1,0)

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):

	#Mientras no se presione nada, el astronauta cae.
	velocity.y = delta*GRAVITY
	var motion = velocity
	move(motion)
	
	#El astronauta se mueve en sentido contrario a la tecla presionada.
	if (Input.is_action_pressed("ui_up")):
		move(direction_up*ASTRO_SPEED)
	if (Input.is_action_pressed("ui_down")):
		move(direction_down*ASTRO_SPEED)
	if (Input.is_action_pressed("ui_left")):
		move(direction_left*ASTRO_SPEED)
	if (Input.is_action_pressed("ui_right")):
		move(direction_right*ASTRO_SPEED)

