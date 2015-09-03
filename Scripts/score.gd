
extends Node2D

var level_score
var global_score
var new_global 
var time = 0
var panel_level
var panel_total
var stars

func _ready():
	level_score  = get_node("/root/global").level_score
	global_score = get_node("/root/global").global_score
	
	new_global = global_score + level_score
	
	stars = calc_score(level_score,get_node("/root/global").max_score)
	
	panel_level = get_node("Panel/LevelScore")
	panel_total = get_node("Panel/TotalScore")
	set_process(true)
	
func _process(delta):
	time += delta
	
	if time > 0.5:
		panel_level.set_text("Level Score: ")
	if time > 1:
		panel_level.set_text("Level Score: " + str(level_score))
	if time > 1.5:
		panel_total.set_text("Total: ")
	if time > 2:
		panel_total.set_text("Total: " + str(new_global))
	if (time > 2.3 and stars >= 1):
		get_node("Star1").set_frame(1)
	if (time > 2.6 and stars >= 2):
		get_node("Star2").set_frame(1)
	if (time > 3 and stars == 3):
		get_node("Star3").set_frame(1)
		
	if (Input.is_action_pressed("ui_accept")):
		get_node("/root/global").goto_scene(get_node("/root/global").next_level)	
	
func calc_score(level_score, max_score):
	var third = max_score/3
	if (level_score >= 2*third and level_score < max_score):
		return 2
	elif (level_score >= max_score):
		return 3
	else:
		return 1