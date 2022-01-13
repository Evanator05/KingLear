extends KinematicBody

var movement = Vector3()
var gravityVector = Vector3()
var horizontalVelocity = Vector3()
export var zPos = 0
onready var floorCast = $floorCast

var maxSpeed = 8
var acceleration = 16
var friction = 0.002
var gravity = 16

var hasKey = false

var moveAnimTimer = 0

func _ready():
	Globals.cameraTrackingPoint = self
	add_to_group("Player")
	
func _process(delta):
	var xDir = (int(Input.is_action_pressed("moveRight")) - int(Input.is_action_pressed("moveLeft")))
	translation.z = lerp(translation.z, zPos, 1 - pow(.3,delta))
	
	horizontalVelocity.x = clamp(horizontalVelocity.x + (acceleration*xDir*delta), -maxSpeed, maxSpeed)
	if not xDir:
		horizontalVelocity.x = lerp(horizontalVelocity.x, 0, 1 - pow(friction,delta))
		moveAnimTimer = 0
	else:
		moveAnimTimer += delta
		$model.scale.x = xDir
	$model.rotation_degrees.z = sin(moveAnimTimer*10)*15
	
	if not is_on_floor():
		gravityVector += Vector3.DOWN * gravity * delta
	elif is_on_floor() and $floorCast.is_colliding():
		gravityVector = -get_floor_normal() * gravity
	else:
		gravityVector = -get_floor_normal()
	
	movement.x = horizontalVelocity.x + gravityVector.x
	movement.y = gravityVector.y
	movement.z = horizontalVelocity.z + gravityVector.z
	
	movement = move_and_slide(movement, Vector3.UP)
