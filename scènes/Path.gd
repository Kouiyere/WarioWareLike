extends Sprite2D

@export var PATH_VARIATIONS_ARRAY: Array = [
	preload("res://graphismes/itinéraires 1.png"),
	preload("res://graphismes/itinéraires 2.png"),
	preload("res://graphismes/itinéraires 3.png")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pickPath()

func pickPath():
	if PATH_VARIATIONS_ARRAY.size() > 1:
		var texture_id: int = randi() % PATH_VARIATIONS_ARRAY.size()
		var chosen_texture: Texture = PATH_VARIATIONS_ARRAY[texture_id]
		texture = chosen_texture
