extends Label
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_node("/root/Main"))
	var money = "%.2f" % get_node("/root/Main").money
	self.text = "Money: $" + money
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_money():
	var money = "%.2f" % get_node("/root/Main").money
	if is_equal_approx(get_node("/root/Main").money, 0):
		money = "0"
	self.text = "Money: $" + money
