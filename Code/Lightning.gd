extends MeshInstance

onready var sounds = [load("res://Audio/thunder1.wav"), load("res://Audio/thunder2.wav")]

var timer = 0

func _ready():
	randomize()

func _process(delta):
	timer -= delta
	visible = (timer > 0)

func strike():
	$AudioStreamPlayer3D.stream = sounds[randi()%sounds.size()]
	$AudioStreamPlayer3D.play()
	timer = .2
