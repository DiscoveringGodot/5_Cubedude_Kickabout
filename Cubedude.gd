extends KinematicBody

const SPEED = 10
const GRAVITY = -5

var motion = Vector3()

func _ready():
	pass

func _physics_process(delta):
	move()
	fall()


func move():
	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		motion.x = 1
	elif Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		motion.x  =-1
	else:
		motion.x = 0
		
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.z  =1
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.z = -1
	else:
		motion.z = 0

	move_and_slide((motion.normalized() * SPEED), Vector3(0,1,0))


func fall():
	if not is_on_floor():
		motion.y = GRAVITY
	else:
		motion.y = 0