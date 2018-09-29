extends Spatial

var Player1_score = 0
var Player2_score = 0

onready var Ball = get_tree().get_root().find_node("Ball", true, false)
export var target_score = 5

func _ready():
	reset_pitch()


func reset_pitch():
	var BallStart = get_tree().get_root().find_node("BallStart", true, false)
	Ball.translation = BallStart.translation
	Ball.axis_lock_linear_x = false
	Ball.axis_lock_linear_z = false
	get_tree().call_group("players", "reset")


func freeze_players():
	get_tree().call_group("players", "can_move", false)


func _on_GoalDetector_body_entered(body, goal_id):
	var Particles1= get_tree().get_root().find_node("Particles1", true, false)
	var Particles2= get_tree().get_root().find_node("Particles2", true, false)
	
	Ball.axis_lock_linear_x = true
	Ball.axis_lock_linear_z = true
	
	update_score(goal_id)
	freeze_players()
	$Timer.start()
	if goal_id == 1:
		Particles1.emitting = true
	else:
		Particles2.emitting = true


func _on_Timer_timeout():
	reset_pitch()


func update_score(goal_id):
	var new_score
	
	if goal_id == 1:
		Player1_score +=1
		new_score = Player1_score
	else:
		Player2_score +=1
		new_score = Player2_score
	$GUI.update_score(goal_id, new_score)
	if new_score == target_score:
		end_game()


func end_game():
	get_tree().quit()