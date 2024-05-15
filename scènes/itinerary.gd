extends Node2D

var answer: Area2D
var starting_points: Array[Node]
var path

# Called when the node enters the scene tree for the first time.
func _ready():
	starting_points = find_children("Itinerary Start*")
	for starting_point in starting_points:
		starting_point.clicked.connect(wrongAnswer)
	
	answer = starting_points[randi() % starting_points.size()]
	answer.clicked.disconnect(wrongAnswer)
	answer.clicked.connect(rightAnswer)
	print(answer)
	

func rightAnswer():
	print("Yeaaah")

func wrongAnswer():
	print("You are lost")
