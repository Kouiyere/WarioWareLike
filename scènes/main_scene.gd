extends Node2D

@onready var victoire= $victoire
@onready var defaite= $defaite
@onready var GameOver= $GameOver
@onready var transitionSound= $Transition
var transition
var transitionScene
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
	transitionSound.play()
	transitionScene = load("res://scènes/transition.tscn")
	transition = transitionScene.instantiate()
	add_child(transition)
	transition.transitionEnd.connect(loadMinigame)


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
	transition.queue_free()
	#transitionScene.visible = false

func minigameWon():
	print("you win")
	minigame.queue_free()
	#transitionScene.visible = true
	victoire.play()
	#transitionScene.reload()
	transitionScene = load("res://scènes/transition.tscn")
	transition = transitionScene.instantiate()
	add_child(transition)
	transition.transitionEnd.connect(loadMinigame)

func minigameLost():
	print("you lost")
	health -= 1
	minigame.queue_free()
	#transitionScene.visible = true
	defaite.play()
	#transitionScene.reload()
	transitionScene = load("res://scènes/transition.tscn")
	transition = transitionScene.instantiate()
	add_child(transition)
	transition.transitionEnd.connect(loadMinigame)
