extends AnimatedSprite

var gass_amount = 100
var init_frame = 0
var gass_percentage = 100
var ten_percent = 10

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):

	if (init_frame == 0):
		gass_amount = get_parent().get_parent().gass_amount
		gass_percentage = gass_amount
		ten_percent = gass_amount*10/100
		init_frame += 1
	
	gass_amount  = get_parent().get_parent().gass_amount
	
	print(gass_amount)
	print("10% ",ten_percent)
	print("Gass% ",gass_percentage)
	
	if (gass_amount <= gass_percentage - ten_percent):
		gass_percentage = gass_amount
		self.set_frame(get_frame()+1)