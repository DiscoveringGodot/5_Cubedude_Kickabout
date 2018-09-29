extends SpotLight

onready var Ball = $"../../Ball"

func _process(delta):
	look_at(Ball.translation, Vector3(0,1,0))