extends CollisionShape2D

var attack_packed_scene = preload("attack.tscn")
onready var fireSound : AudioStreamPlayer = get_node("/root/Main/Fire")
onready var lightningSound : AudioStreamPlayer = get_node("/root/Main/Lightning")
onready var lightningPlusSound : AudioStreamPlayer = get_node("/root/Main/LightningPlus")
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
	if(area.name_check == "bat") && get_parent().health > 0:
		
		$"../AnimatedSprite".play("Attack")
		area.animated_sprite.play("death_enemy")
		area.animation_locked = true


func _on_Enemy_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click") && $"../AnimatedSprite".animation != "Death":
		
		var attack = attack_packed_scene.instance().duplicate()
		attack.position = event.position
		get_node("/root/Main").add_child(attack)
		print(str(event.position, " - ", $"..".position))
		
		if(get_node("/root/Main").weapon_strength == 1):
			attack.get_child(0).play("fire")
			fireSound.play()
		if(get_node("/root/Main").weapon_strength == 2):
			attack.get_child(0).play("lighting")
			lightningSound.play()
		if(get_node("/root/Main").weapon_strength == 3):
			attack.get_child(0).play("lightningDouble")
			lightningPlusSound.play()
		
		$"../AnimatedSprite".play("Damage")
		print(event.position)
		self.get_parent().health -= get_node("/root/Main").weapon_strength
		self.get_parent().isFleeing = true
		self.get_parent().inverse_mouse_position = event.position
		
		if self.get_parent().health <= 0:
			for bat in get_tree().get_nodes_in_group("bats"):
				bat.hunger_timer.paused = false
				bat.death_timer.paused = false
			get_node("/root/Main/SpawnTimer").start()
			$"../AnimatedSprite".play("Death")
