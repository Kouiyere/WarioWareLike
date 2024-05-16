extends Node2D

var transitionScene: Node2D
var MINIGAME_SCENES_ARRAY: Array = [
	"res://scènes/fourneau_minigame.tscn",
	"res://scènes/itinerary.tscn"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	transitionScene = find_child("TransitionScene")
	load("TransitionScene")
	transitionScene.transitionEnd.connect(loadMinigame)


func loadMinigame():
	var sceneID: int = randi() % MINIGAME_SCENES_ARRAY.size()
	var path: String = MINIGAME_SCENES_ARRAY[sceneID]
	var minigameScene = load(path)
	var minigame = minigameScene.instantiate()
	add_child(minigame)
	minigame.win.connect(minigameWon)
	minigame.lose.connect(minigameLost)

func minigameWon():
	print("you win")

func minigameLost():
	print("you lost")
