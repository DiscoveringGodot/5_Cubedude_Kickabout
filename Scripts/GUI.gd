extends CanvasLayer


func update_score(player, score):
	if player == 1:
		$NinePatchRect/HBoxContainer/CenterContainer1/Player1Score.text = str(score)
	else:
		$NinePatchRect/HBoxContainer/CenterContainer2/Player2Score.text = str(score)

func game_over():
	pass