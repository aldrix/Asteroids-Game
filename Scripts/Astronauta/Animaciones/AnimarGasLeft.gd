extends AnimatedSprite

var play = false

func _ready():
	set_process(true)
   
func _process(delta):
   
	if(play):
		if(get_frame() == self.get_sprite_frames().get_frame_count()-1):
			set_frame(0)
		else:
			self.set_frame(get_frame()+ 1)
	else:
		set_frame(0)

func play():
	play = true
	
func stop():
	play = false