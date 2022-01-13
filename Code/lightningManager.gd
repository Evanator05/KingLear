extends Spatial

onready var lightning = get_children()
var timer = 0

func _ready():
	randomize()
	timer = randi()%45+5

func _process(delta):
	timer -= delta
	if timer <= 0:
		timer = randi()%45+5
		lightning[randi()%lightning.size()].strike()
