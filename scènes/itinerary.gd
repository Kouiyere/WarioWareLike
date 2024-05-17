extends Node2D

signal win
signal lose

@export var answer: Area2D
@export var starting_points: Array[Node]
var path: Sprite2D
var paths: Array
var target: Sprite2D
var end_points: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	starting_points = find_children("Itinerary Start*")
	for starting_point in starting_points:
		starting_point.clicked.connect(wrongAnswer)
	
	answer = starting_points[randi() % starting_points.size()]
	answer.clicked.disconnect(wrongAnswer)
	answer.clicked.connect(rightAnswer)
	path = find_child("Path")
	paths = path.PATH_VARIATIONS_ARRAY
	target = find_child("Target")
	end_points = find_child("Itinerary End").end_points
	self.setTarget()
	print(answer)

func rightAnswer():
	win.emit()

func wrongAnswer():
	lose.emit()

func setTarget():
	if path.texture == paths[0]:
		if answer == starting_points[0]:
			target.texture = end_points[2].texture
		elif answer == starting_points[1]:
			target.texture = end_points[1].texture
		else:
			target.texture = end_points[0].texture
	elif path.texture == paths[1]:
		if answer == starting_points[0]:
			target.texture = end_points[2].texture
		elif answer == starting_points[1]:
			target.texture = end_points[1].texture
		else:
			target.texture = end_points[0].texture
	else:
		if answer == starting_points[0]:
			target.texture = end_points[0].texture
		elif answer == starting_points[1]:
			target.texture = end_points[1].texture
		else:
			target.texture = end_points[2].texture
