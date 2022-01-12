extends Control

export var fadeAmount = 0
var startTimer = 0
onready var fade = $Fade
func _process(delta):
	startTimer += delta
	if startTimer > 3:
		fade.modulate.a = lerp(fade.modulate.a, fadeAmount, 1 - pow(.4, delta))
		if fade.modulate.a == 0:
			$Fade/Label.visible = false
	else:
		get_parent().translation.x = 0
