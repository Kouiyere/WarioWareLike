extends Node2D

var answer: Area2D
var starting_points: Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready():
	starting_points = find_children("Itinerary Start*")
	answer = starting_points[randi() % starting_points.size()]
	print(answer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
