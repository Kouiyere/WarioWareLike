extends Node2D

@export var DESTINATION_VARIATIONS_ARRAY: Array = [
	preload("res://graphismes/destination 1.png"),
	preload("res://graphismes/destination 2.png"),
	preload("res://graphismes/destination 3.png")
]

@export var end_points: Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready():
	end_points = find_children("End*")
	for end_point in end_points:
		var texture_id: int = randi() % DESTINATION_VARIATIONS_ARRAY.size()
		end_point.texture = DESTINATION_VARIATIONS_ARRAY[texture_id]
		DESTINATION_VARIATIONS_ARRAY.remove_at(texture_id)
