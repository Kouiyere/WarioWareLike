extends Node2D

var transitionScene: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	transitionScene = find_child("TransitionScene")
	transitionScene.transitionEnd.connect(loadMinigame)
	load("res://scènes/transition.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func loadMinigame():
	print("launching Minigame")
