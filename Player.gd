extends KinematicBody
var speed = 300
var direction = Vector3()
var gravity = -9.8
var velocity = Vector3()
var coins = 0
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func take_coin():
	coins += 1
	print(coins)
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	direction = Vector3(0,0,0)
	if Input.is_action_pressed("go_left"):
		direction.x -=1
	if Input.is_action_pressed("go_right"):
		direction.x +=1
	if Input.is_action_pressed("forward"):
		direction.z -=1
	if Input.is_action_pressed("go_back"):
		direction.z +=1
	direction = direction.normalized()
	direction = direction * speed * delta
	velocity = move_and_slide(velocity,Vector3(0,1,0))
	
	if velocity.y > 0:
		gravity = -10
	else:
		gravity = -20
	
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z

	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		velocity.y = 10
		
	