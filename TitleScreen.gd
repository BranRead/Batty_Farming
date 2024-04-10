extends Node2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var screen_size = get_viewport().size
var is_game = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Options/ColorRect/CheckBox.pressed = true
	$Options/ColorRect/CheckBox3.pressed = true
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	$StartGame.visible = false
	$Options.visible = true

func _on_BackButton_pressed():
	$StartGame.visible = true
	$Options.visible = false

	
	
func _on_PlayButton_pressed():
	if $Options/ColorRect/CheckBox.pressed:
		get_node("/root/GameLogic").fungus_chance = 0
	else:
		get_node("/root/GameLogic").bat_cost = 0.50
	if !$Options/ColorRect/CheckBox3.pressed:
		get_node("/root/GameLogic").fungus_chance = 0.3
	get_tree().change_scene("res://main.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()


func _on_CheckBox_pressed():
	if $Options/ColorRect/CheckBox.pressed:
		$Options/ColorRect/CheckBox2.pressed = false
		$Options/ColorRect/CheckBox3.pressed = false
		$Options/ColorRect/CheckBox3.visible = false
		$Options/ColorRect/Boots.visible = false
	else:
		$Options/ColorRect/CheckBox.pressed = true

func _on_CheckBox2_pressed():
	if $Options/ColorRect/CheckBox2.pressed:
		$Options/ColorRect/CheckBox.pressed = false
		$Options/ColorRect/CheckBox3.visible = true
		$Options/ColorRect/Boots.visible = true
	else:
		$Options/ColorRect/CheckBox2.pressed = true







