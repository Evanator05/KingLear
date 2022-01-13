extends MeshInstance


var timer = 0

func _ready():
	pass

func _process(delta):
	timer += delta
	
	rotation_degrees.x = sin(timer)*0.2
	rotation_degrees.y = sin(timer)*0.2
	rotation_degrees.z = sin(timer)*0.2
