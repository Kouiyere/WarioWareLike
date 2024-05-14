extends Node2D

var answer: Sprite2D
var starting_points: Node[]

# Called when the node enters the scene tree for the first time.
func _ready():
	starting_points = find_children("Start?")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
