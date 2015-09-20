
extends Panel

var textbox

func _ready():
	_set_dialog()


func _set_dialog():

	textbox = get_node("Label")
	self.set_begin( Vector2(-200,-200) )
	self.set_end( Vector2(485,110) )
	
	textbox.set_text('Hello!')