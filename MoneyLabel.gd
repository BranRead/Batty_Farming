extends Label


var style_box = StyleBoxFlat.new()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	style_box.bg_color = Color.black
	self.add_stylebox_override("normal", style_box)
	
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
