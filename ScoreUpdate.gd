extends CanvasLayer
var serverURL = "https://quantum-arcade.com/php/addScore.php"



# Called when the node enters the scene tree for the first time.
func _ready():
	_send_request()

func _send_request():
	var client = HTTPClient.new()
	var gameID = 4
	#var score = get_node("/root/GameLogic").time_taken
	
	var dict = {"userID":get_node("/root/GameLogic").user_id, "gameID":gameID, "score":get_node("/root/GameLogic").finished_score}
	
	#print(dict)

	var data = JSON.print(dict)
	#var headers = ["Content-Type: application/json"]
	#Somethihg else attempted 
	var headers = ["Content-Type: application/x-www-form-urlencoded"]
	
	
	$HTTPRequest.request(serverURL, headers, false, client.METHOD_POST, data)
	print(data)
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
