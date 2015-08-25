
extends Node2D

var astro      #Localizara al astronauta
var mineralCollider

func _ready():
	astro = get_node("root/Scenes/Astronauta.scn")
	mineralCollider = CircleShape2D.new()
	set_process(true)
	
func _process(delta): 

	pass