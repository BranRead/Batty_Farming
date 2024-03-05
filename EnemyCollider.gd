extends CollisionShape2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Enemy_area_entered(area):
	if(area.name_check == "bat"):
		area.bat_death()


func _on_Enemy_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		print(event.position)
		self.get_parent().health -= get_node("/root/Main").weapon_strength
		self.get_parent().isFleeing = true
		self.get_parent().inverse_mouse_position = event.position
		print(self.get_parent().health)
		if self.get_parent().health <= 0:
			for bat in get_tree().get_nodes_in_group("bats"):
				bat.hunger_timer.paused = false
				bat.death_timer.paused = false
			get_node("/root/Main/SpawnTimer").start()
			self.get_parent().queue_free()
