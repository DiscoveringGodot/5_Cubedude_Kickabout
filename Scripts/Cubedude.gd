extends KinematicBody

const SPEED = 8
const GRAVITY = -5
const EPSILON = 0.00001
const FRICTION = 0.9999

var motion = Vector3()
var can_move = false

export var player_id = 1

func _ready():
	if player_id== 1:
		get_node("Armature/Skeleton/Cube Dube").set_surface_material(0,load("res://GFX/Cubedude/CubeDubePurple.material"))
	reset()


func _physics_process(delta):
	if can_move:
		move()
	fall()


func _process(delta):
	if can_move:
		animate()
		look_at(Vector3(-motion.x, 0, -motion.z)*SPEED, Vector3(0,1,0))
	else:
		$AnimationPlayer.stop()


func move():
	if Input.is_action_pressed("up_%s" %player_id) and not Input.is_action_pressed("down_%s" %player_id):
		motion.x = 1
	elif Input.is_action_pressed("down_%s" %player_id) and not Input.is_action_pressed("up_%s" %player_id):
		motion.x  =-1
	else:
		motion.x = lerp(motion.x, 0, FRICTION)
		
	if Input.is_action_pressed("right_%s" %player_id) and not Input.is_action_pressed("left_%s" %player_id):
		motion.z  =1
	elif Input.is_action_pressed("left_%s" %player_id) and not Input.is_action_pressed("right_%s" %player_id):
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


func can_move(value):
	can_move = value


func reset():
	var spawn = get_tree().get_root().find_node(("Player%sStart" % player_id), true, false)
	
	translation = spawn.translation
	motion = Vector3(0,0,0)
	can_move(true)