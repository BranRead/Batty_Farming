extends Area2D

export var idle_speed = {"x": 40, "y": 40}
export var chasing_food_speed = {"x": 0.75, "y": 0.75}
export var lower_speed_threshold = 25
var name_check : String = "bat";

export var movement_change_threshold : float = 0.99
var rng = RandomNumberGenerator.new()
onready var animated_sprite : AnimatedSprite = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	
	rng.randomize()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("flying")
	var change_movement_chance : float = rng.randf()
	if change_movement_chance > movement_change_threshold:
		idle_speed.x = rng.randf_range(-40, 40)
		print(idle_speed.x)
		if idle_speed.x > -lower_speed_threshold && idle_speed.x <= 0:
			idle_speed.x - lower_speed_threshold
		elif idle_speed.x < lower_speed_threshold && idle_speed.x > 0:
			idle_speed.x + lower_speed_threshold
			
		idle_speed.y = rng.randf_range(-40, 40)
		if idle_speed.y > -lower_speed_threshold && idle_speed.y <= 0:
			idle_speed.y -lower_speed_threshold
		elif idle_speed.y < lower_speed_threshold && idle_speed.y > 0:
			idle_speed.y +lower_speed_threshold
	
	if idle_speed.x > 0:
		animated_sprite.play("fly_right")
	elif idle_speed.x < 0: 
		animated_sprite.play("fly_left")
	self.position.x += idle_speed.x * delta
	self.position.y += idle_speed.y * delta
	
func _on_Bat_area_entered(area):
	print(area.name)
	if(area.name_check == "food"):
		print("The bat ate the strawberry")
		area.free()
