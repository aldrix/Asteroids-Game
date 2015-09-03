
extends Node2D

var level_score
var global_score
var new_global 
var time = 0
var panel_level
var panel_total

func _ready():
	level_score  = get_node("/root/global").level_score
	global_score = get_node("/root/global").global_score
	
	new_global = global_score + level_score
	
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
		
	if (Input.is_action_pressed("ui_accept")):
		get_node("/root/global").goto_scene(get_node("/root/global").next_level)	
	