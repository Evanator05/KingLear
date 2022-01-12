extends KinematicBody

var movement = Vector3()

export var zPos = 0
onready var floorCast = $floorCast

var maxSpeed = 8
var acceleration = 16
var friction = 0.002
var gravity = 16
func _ready():
	Globals.cameraTrackingPoint = $cameraPoint

func _process(delta):
	var xDir = (int(Input.is_action_pressed("moveRight")) - int(Input.is_action_pressed("moveLeft")))
	translation.z = lerp(translation.z, zPos, 1 - pow(.3,delta))
	
	movement.x = clamp(movement.x + (acceleration*xDir*delta), -maxSpeed, maxSpeed)
	if not xDir:
		movement.x = lerp(movement.x, 0, 1 - pow(friction,delta))
		
	movement.y -= gravity*delta
	
	movement = move_and_slide(movement, Vector3.UP)
