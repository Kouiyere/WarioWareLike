extends Node2D

var transitionScene: Node2D
var minigame
var MINIGAME_SCENES_ARRAY: Array = [
	"res://scènes/fourneau_minigame.tscn",
	"res://scènes/itinerary.tscn",
	"res://scènes/SceneValise.tscn",
	"res://scènes/cadran_minigame.tscn"
]
@export var health: int
var currentMinigamID: int

# Called when the node enters the scene tree for the first time.
func _ready():
	transitionScene = find_child("TransitionScene")
	load("TransitionScene")
	transitionScene.transitionEnd.connect(loadMinigame)


func loadMinigame():
	var IDs : Array
	for scene in MINIGAME_SCENES_ARRAY:
		IDs.push_back(MINIGAME_SCENES_ARRAY.find(scene))
	IDs.remove_at(IDs.find(currentMinigamID))
	
	var IDtoLoad : int = IDs[randi() % IDs.size()]
	var path: String = MINIGAME_SCENES_ARRAY[IDtoLoad]
	var minigameScene = load(path)
	minigame = minigameScene.instantiate()
	add_child(minigame)
	minigame.win.connect(minigameWon)
	minigame.lose.connect(minigameLost)
	currentMinigamID = IDtoLoad
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

