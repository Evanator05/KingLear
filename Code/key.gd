extends Area

func _on_key_body_entered(body):
	if body.is_in_group("Player"):
		body.hasKey = true
		queue_free()
