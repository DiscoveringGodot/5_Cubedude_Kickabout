extends DirectionalLight

func _ready():
	reset_pitch()

func reset_pitch():
	light_energy = 0.5


func goal(goal_id):
	$AnimationPlayer.play("DimLights")