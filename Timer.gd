extends Timer
var time_base : float = 10.0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.wait_time = time_base
	self.autostart = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
