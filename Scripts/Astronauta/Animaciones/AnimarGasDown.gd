
extends AnimatedSprite


func _ready():
	set_process(true)
   
func _process(delta):
   
	if(Input.is_action_pressed("ui_down")):
		if(get_frame() == self.get_sprite_frames().get_frame_count()-1):
			set_frame(0)
		else:
			self.set_frame(get_frame()+ 1)
	else:
		set_frame(0)