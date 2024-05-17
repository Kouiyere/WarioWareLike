extends Sprite2D

@export var PELLE_SPRITE_ARRAY: Array = [
	preload("res://graphismes/pelle 1.png"),
	preload("res://graphismes/pelle 2.png"),
	preload("res://graphismes/pelle 3.png")
]
var clickArea: Area2D
var nextTextureID: int

# Called when the node enters the scene tree for the first time.
func _ready():
	clickArea = get_parent().get_node("ClickableArea")
	clickArea.clicked.connect(switchShovelTexture)
	nextTextureID = 1

func switchShovelTexture():
	texture = PELLE_SPRITE_ARRAY[nextTextureID]
	nextTextureID += 1
	if nextTextureID == PELLE_SPRITE_ARRAY.size():
		nextTextureID = 0
