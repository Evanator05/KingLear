extends Spatial

var timer = 0
	
func _process(delta):
	timer += delta
	global_transform.origin.x = lerp(translation.x, Globals.cameraTrackingPoint.global_transform.origin.x, 1 - pow(0.002, delta))
	global_transform.origin.y = lerp(translation.y, Globals.cameraTrackingPoint.global_transform.origin.y+3, 1 - pow(0.002, delta))
	
	translation.z = lerp(translation.z, Globals.cameraZoom, 1 - pow(0.002, delta))
	
	rotation_degrees.y = cos(timer*2)*.5
	rotation_degrees.x = cos(timer)*.5
	rotation_degrees.z = cos(timer)*.5
