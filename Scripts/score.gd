
extends Node2D

var level_score
var global_score
var new_global 
var panel_level
var panel_total
var animation
var stars

func _ready():

	animation = get_node("Animacion")
	animation.play("SuccessIntro")
	
	#Calculamos los scores
	level_score  = round(get_node("/root/global").level_score)
	global_score = get_node("/root/global").global_score
	new_global = global_score + level_score
	
	#Actualizamos el nuevo score.
	get_node("/root/global").set("global_score",new_global)
	
	#Calculamos el numero de estrellas
	stars = calc_score(level_score,get_node("/root/global").max_score)
	if stars == 1:
		animation.queue("1Star")
	elif stars == 2:
		animation.queue("2Star")
	else:
		animation.queue("3Star")
	
	panel_level = get_node("LevelScore")
	panel_total = get_node("TotalScore")
	panel_level.set_text("Level Score: " + str(level_score))
	panel_total.set_text("Total: " + str(new_global))
	
	animation.queue("Score")
	
	set_process_input(true)
	
func _input(event):
	if (get_node("Continue").is_pressed()):
		get_node("/root/global").goto_scene(get_node("/root/global").next_level)	
	
func calc_score(level_score, max_score):
	var third = max_score/3
	if (level_score >= 2*third and level_score < max_score):
		return 2
	elif (level_score >= max_score):
		return 3
	else:
		return 1