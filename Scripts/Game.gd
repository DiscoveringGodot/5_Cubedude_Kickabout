extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func free_players():
	get_tree().call_group("players", "can_move", true)


func freeze_players():
	get_tree().call_group("players", "can_move", false)


func _on_GoalDetector_body_entered(body, goal_id):
	print("goal in player %s's goal!" % goal_id)
	freeze_players()
	$Timer.start()




func _on_Timer_timeout():
	free_players()
