extends Spatial

export var fadeAmount = 0
var fadeSpeed = 0.8
onready var fade = $UI/Fade

var changeScene = false
var scene = ""

onready var camera = $Camera
var timer = 0



onready var yRot = camera.rotation_degrees.y
onready var xRot = camera.rotation_degrees.x
onready var zRot = camera.rotation_degrees.z

onready var water = $water

func _process(delta):
	fade.color.a = lerp(fade.color.a, fadeAmount, 1 - pow(fadeSpeed, delta))
	timer += delta
	camera.rotation_degrees.y = yRot + (cos(timer+1)*1.5)
	camera.rotation_degrees.x = xRot + (cos(timer+1)*.5)
	camera.rotation_degrees.z = zRot + (cos(timer*2+1)*.5)
	
	water.rotation_degrees.z = (cos(timer)+1)*.2
	water.rotation_degrees.x = (cos(timer+1)+1)*1
	water.rotation_degrees.y = (cos(timer))*1.5
	
	if changeScene:
		if fade.color.a > .99:
			var _level = get_tree().change_scene(scene)


func _on_Play_pressed():
	changeScene = true
	scene = "res://Scenes/Level.tscn"
	fadeAmount = 1
	fadeSpeed = 0.03
