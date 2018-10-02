extends SpotLight

func _ready():
	reset_pitch()


func reset_pitch():
	hide()


func goal(player):
	var Player1 = get_tree().get_root().find_node("Player1", true, false)
	var Player2 = get_tree().get_root().find_node("Player2", true, false)

	if player == 1:
		look_at(Player1.translation, Vector3(0,1,0))
	else:
		look_at(Player2.translation, Vector3(0,1,0))
		
	show()
