extends Spatial

func _ready():
	pass

func _on_GoalDetection_body_entered(body, goal_id):
	print("Player " + str(goal_id) + " has scored!")
