extends CanvasLayer

func update_score(player, score):
	if player == 1:
		$HBoxContainer/CenterContainer/Player1Score.text = str(score)
	else:
		$HBoxContainer/CenterContainer2/Player2Score.text = str(score)