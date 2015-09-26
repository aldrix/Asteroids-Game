
extends Camera2D

var animation
var target

func _ready():
	animation = get_parent().get_node("Animacion")
	animation.play("Camera Movement")
	target = get_parent().get_node("Astronauta")
	set_process(true)
	
func _process(delta):
	var gt = target.get_global_transform()
	if not(animation.is_playing()):
		self.set_global_transform(gt)
	pass