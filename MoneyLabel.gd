extends Label
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var money = "%.2f" % get_parent().money
	self.text = "Money: $" + money

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_money():
	var money = "%.2f" % get_parent().money
	if is_equal_approx(get_parent().money, 0):
		money = "0"
	self.text = "Money: $" + money
