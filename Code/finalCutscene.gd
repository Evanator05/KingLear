extends Area


func _ready():
	pass


func _on_finalCutscene_body_entered(body):
	if body.is_in_group("Player"):
		body.queue_free()
		$lear.visible = true
		$AnimationPlayer.play("ending")
