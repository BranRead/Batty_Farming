extends Area2D

var health : int = 10
var closest_bat
var speed : float = 40
var name_check : String = "enemy"
var flee_speed : float = 120
export var flee_time : float = .4
var delta_flee_time : float = 0
var isFleeing : bool = false
var inverse_mouse_position

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("Fly")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if(self.health <=0):
	#	self.free()
	if !isFleeing:
		var bats_on_screen = get_parent().get_tree().get_nodes_in_group("bats")
		closest_bat = null
		var closest_distance = 2000
		
		for bat in bats_on_screen:
			if bat != null:
				var distance = self.position.distance_to(bat.position)
				if distance < closest_distance:
					closest_bat = bat
					closest_distance = distance
			if closest_bat != null:
				if self.position.x > self.position.move_toward(closest_bat.position, self.speed * delta).x:
					$AnimatedSprite.flip_h = false
				else:
					$AnimatedSprite.flip_h = true
				self.position = self.position.move_toward(closest_bat.position, self.speed * delta)
	else:
		delta_flee_time += delta
		
		if(delta_flee_time > flee_time):
			isFleeing = false
			delta_flee_time = 0
		
		if inverse_mouse_position.x > self.position.x:
			self.position.x -= self.flee_speed * delta
			$AnimatedSprite.flip_h = false
		else: 
			self.position.x += self.flee_speed * delta
			$AnimatedSprite.flip_h = true
			
		if inverse_mouse_position.y > self.position.y:
			self.position.y -= self.flee_speed * delta
		else: 
			self.position.y += self.flee_speed * delta

