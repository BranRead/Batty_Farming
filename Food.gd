extends Area2D

export var falling_speed : float = 80
var name_check : String = "food";
var cost : float = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.y += falling_speed * delta
