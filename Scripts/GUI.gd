extends CanvasLayer

func update_score(player, score):
	if player == 1:
		$NinePatchRect/HBoxContainer/CenterContainer/Player1Score.text = str(score)
	else:
		$NinePatchRect/HBoxContainer/CenterContainer2/Player2Score.text = str(score)


func end_game(player):
	$Popup/CenterContainer/VictoryLabel.text = "Player " + str(player) + " wins!"
	$Popup.popup_centered()
	

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
