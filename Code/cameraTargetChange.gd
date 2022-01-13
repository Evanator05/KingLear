extends Area

export(NodePath) var cameraPoint = null
export var cameraZoom = 10


func _on_cameraTargetChange_body_entered(body):
	if body.is_in_group("Player"):
		Globals.cameraTrackingPoint = get_node(cameraPoint)
		Globals.cameraZoom = cameraZoom
