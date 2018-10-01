extends RigidBody


func _on_Ball_body_entered(body):
	if body is KinematicBody and not $AudioStreamPlayer3D.is_playing():
		$AudioStreamPlayer3D.play()
