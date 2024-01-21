extends Area2D

export var falling_speed : float = 80
var name_check : String = "guano"
var is_selected : bool = false
var worth : float = 0.25
onready var collect_sound : AudioStreamPlayer = $CollectSound
var is_fallen_off_screen = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.y += falling_speed * delta
	
	if Input.is_action_just_pressed("click") && is_selected:
		#print("Clicking Guano")
		collect_guano()

func _on_Guano_mouse_entered():
	is_selected = true

func _on_Guano_mouse_exited():
	is_selected = false

func collect_guano():
	get_parent().guano_collected += 1
	get_parent().money += self.worth
	get_parent().get_node("MoneyLabel").update_money()
	#print("Guano collected: " + str(get_parent().guano_collected))
	self.queue_free()
