extends Node2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var screen_size = get_viewport().size
var is_game = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayButton_pressed():
	get_tree().change_scene("res://main.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
