extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_HTTPRequest_request_completed")
	$HTTPRequest.request("http://localhost/quantum_arcade/play.php")
	
func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var userID = body.get_string_from_utf8()
	#print(json.result)
	
	if(userID != null):
		get_node("/root/GameLogic").user_id = userID

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

