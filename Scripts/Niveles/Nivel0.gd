extends Node2D

var gass_amount = 1000

func _ready():
	set_process(true)

func _process(delta):
	print(gass_amount)