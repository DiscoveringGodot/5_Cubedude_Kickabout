extends Spatial

var Player1_score = 0
var Player2_score = 0

export var target_score = 5

func _ready():
	reset_pitch()
	pass


func reset_pitch():
	var Ball = get_tree().get_root().find_node("Ball", true, false)
	var BallStart = get_tree().get_root().find_node("BallStart", true, false)
	Ball.translation = BallStart.translation
	get_tree().call_group("players", "reset")


func freeze_players():
	get_tree().call_group("players", "can_move", false)


func _on_GoalDetector_body_entered(body, goal_id):
	update_score(goal_id)
	freeze_players()
	$Timer.start()
	if goal_id == 1:
		$Particles1.emitting = true
	else:
		$Particles2.emitting = true


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