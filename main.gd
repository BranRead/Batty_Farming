extends Node
var food_packed_scene = preload("Food.tscn")
var bat_packed_scene = preload("Bat.tscn")
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click"):
		var mouse_position = get_viewport().get_mouse_position()
		var food = food_packed_scene.instance()
		food.position = mouse_position
		add_child(food)
		
	if Input.is_action_just_pressed("right_click"):
		var mouse_position = get_viewport().get_mouse_position()
		var bat = bat_packed_scene.instance()
		bat.position = mouse_position
		add_child(bat)
