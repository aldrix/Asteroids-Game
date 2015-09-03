extends Node2D

const ASTRO_SPEED = 1.5
const GRAVITY = 15.0

var velocity        = Vector2()
var direction_up    = Vector2(0,1)
var direction_down  = Vector2(0,-1)
var direction_left  = Vector2(1,0)
var direction_right = Vector2(-1,0)
var body
var gass_amount = 100

func has_gass(gass_amout):
	if(gass_amount > 0):
		return true
	else:
		return false

func _ready():
	gass_amount  = get_parent().gass_amount
		
	if get_parent().get_name() == "Main":
		get_node("KinematicBody2D/Camera2D").set_limit(0,0)
		get_node("KinematicBody2D/Camera2D").set_limit(1,0)
		get_node("KinematicBody2D/Camera2D").set_limit(2,0)
		get_node("KinematicBody2D/Camera2D").set_limit(3,0)
		
	body = get_node("KinematicBody2D")
	set_fixed_process(true)

func _fixed_process(delta):

	#Mientras no se presione nada, el astronauta cae.
	velocity.y = delta*GRAVITY
	var motion = velocity
	body.move(motion)
	
	#El astronauta se mueve en sentido contrario a la tecla presionada.
	if (Input.is_action_pressed("ui_up") and has_gass(gass_amount)):
		body.move(direction_up*ASTRO_SPEED)
		gass_amount -= delta
	if (Input.is_action_pressed("ui_down") and has_gass(gass_amount)):
		body.move(direction_down*ASTRO_SPEED)
		gass_amount -= delta
	if (Input.is_action_pressed("ui_left") and has_gass(gass_amount)):
		body.move(direction_left*ASTRO_SPEED)
		gass_amount -= delta
	if (Input.is_action_pressed("ui_right")and has_gass(gass_amount)):
		body.move(direction_right*ASTRO_SPEED)
		gass_amount -= delta
	
	if (get_node("KinematicBody2D").is_colliding()):
		if (get_node("KinematicBody2D").get_collider().get_name() == "Nave"):
			print("Astro llego a la nave! :D");
			get_parent().set("win",true)