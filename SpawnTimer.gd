extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	self.paused = true
	rng.randomize()
	self.wait_time = 15.0
	self.autostart = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	
	
