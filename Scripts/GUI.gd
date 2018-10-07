extends CanvasLayer

func update_score(player, score):
	var score_label = get_node("Banner/HBoxContainer/Player%sScore" % player)
	score_label.text = str(score)

func game_over(player):
	var label = $Popup/NinePatchRect/VBoxContainer/Label
	label.text = ("Player " + str(player) + " wins!")
	$Popup.popup_centered()

func _on_Button_pressed():
	get_parent().restart_game()
