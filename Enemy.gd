extends Area2D

var health : int = 10
var closest_bat
var speed : float = 40
var name_check : String = "enemy"

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


func _on_Enemy_area_entered(area):
	if(area.name_check == "bat"):
		area.remove_from_group("bats")
		area.free()
