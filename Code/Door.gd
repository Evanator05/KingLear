extends Spatial

var unlocked = false

func _process(delta):
	$DoorHinge.rotation_degrees.y = lerp($DoorHinge.rotation_degrees.y, 90*int(unlocked), 1 - pow(0.05, delta))

func unlockDoor():
	$openSound.stream = load("res://Audio/doorOpen.wav")
	$openSound.play()
	$StaticBody/CollisionShape.disabled = true
	unlocked = true


func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		if not unlocked:
			if body.hasKey:
				unlockDoor()
			else:
				$openSound.play()
		
