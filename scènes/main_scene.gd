extends Node2D

var transitionScene: Node2D
var minigame
var MINIGAME_SCENES_ARRAY: Array = [
	"res://scènes/fourneau_minigame.tscn",
	"res://scènes/itinerary.tscn",
	"res://scènes/SceneValise.tscn"
]
@export var health: int

# Called when the node enters the scene tree for the first time.
func _ready():
	transitionScene = find_child("TransitionScene")
	load("TransitionScene")
	transitionScene.transitionEnd.connect(loadMinigame)


func loadMinigame():
	var sceneID: int = randi() % MINIGAME_SCENES_ARRAY.size()
	var path: String = MINIGAME_SCENES_ARRAY[sceneID]
	var minigameScene = load(path)
	minigame = minigameScene.instantiate()
	add_child(minigame)
	minigame.win.connect(minigameWon)
	minigame.lose.connect(minigameLost)
	transitionScene.visible = false

func minigameWon():
	print("you win")
	minigame.queue_free()
	transitionScene.visible = true
	transitionScene.reload()

func minigameLost():
	print("you lost")
	health -= 1
	minigame.queue_free()
	transitionScene.visible = true
	transitionScene.reload()
