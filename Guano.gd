extends Area2D

export var falling_speed : float = 80
var name_check : String = "guano"
var is_selected : bool = false
var normal_worth : float = 0.25
var gold_worth : float = 0.75

var is_at_bottom = false
var is_gone = false
var fade_delta = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_at_bottom == false:
		self.position.y += falling_speed * delta
	else: 
		fade_delta += delta
		self.modulate.a = 1 - (fade_delta/self.get_child(3).wait_time)
		if is_equal_approx(self.modulate.a, 0):
			self.is_gone = true
			self.queue_free()

	if Input.is_action_just_pressed("click") && is_selected:
		#print("Clicking Guano")
		collect_guano()

func _on_Guano_mouse_entered():
	is_selected = true

func _on_Guano_mouse_exited():
	is_selected = false

func collect_guano():
	get_parent().guano_collected += 1
	
	if $AnimatedSprite.animation == "base":
		get_parent().money += self.normal_worth
	else:
		get_parent().money += self.gold_worth
	get_parent().get_node("MoneyBackground/MoneyLabel").update_money()
	self.queue_free() 
