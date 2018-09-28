extends KinematicBody

const SPEED = 8
const GRAVITY = -5
const EPSILON = 0.00001
const FRICTION = 0.95

var motion = Vector3()

func _ready():
	pass

func _physics_process(delta):
	move()
	fall()


func _process(delta):
	animate()
	look_at(Vector3(-motion.x, 0, -motion.z)*SPEED, Vector3(0,1,0))


func move():
	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		motion.x = 1
	elif Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		motion.x  =-1
	else:
		motion.x = lerp(motion.x, 0, FRICTION)
		
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.z  =1
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.z = -1
	else:
		motion.z = lerp(motion.z, 0, FRICTION)

	move_and_slide((motion.normalized() * SPEED), Vector3(0,1,0))


func fall():
	if not is_on_floor():
		motion.y = GRAVITY
	else:
		motion.y = 0


func animate():
	if motion.length() > EPSILON:
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("Arms Cross Walk")
	else:
		$AnimationPlayer.stop()