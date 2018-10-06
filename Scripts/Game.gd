extends Spatial

onready var Ball = get_tree().get_root().find_node("Ball", true, false)

func _ready():
	reset_pitch()


func reset_pitch():
	var BallSpawn =get_tree().get_root().find_node("BallSpawn", true, false)
	Ball.translation = BallSpawn.translation
	Ball.axis_lock_linear_x = false
	Ball.axis_lock_linear_y = false
	Ball.axis_lock_linear_z = false
	get_tree().call_group("player", "reset")



func _on_GoalDetection_body_entered(body, goal_id):
	Ball.axis_lock_linear_x = true
	Ball.axis_lock_linear_y = true
	Ball.axis_lock_linear_z = true
	get_tree().call_group("player", "can_move", false)
	print("Player " + str(goal_id) + " has scored!")
	$Timer.start()
	


func _on_Timer_timeout():
	reset_pitch()
