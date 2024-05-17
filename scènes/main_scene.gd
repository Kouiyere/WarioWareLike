extends Node2D

@onready var son_victoire= $Victoire
@onready var son_defaite= $Defaite
@onready var son_game_over= $Game_Over
@onready var son_transition= $Transition
var transitionScene: Node2D
var minigame
var MINIGAME_SCENES_ARRAY: Array = [
	"res://scènes/fourneau_minigame.tscn",
	"res://scènes/itinerary.tscn",
	"res://scènes/Foule.tscn"
]
@export var health: int

# Called when the node enters the scene tree for the first time.
func _ready():
	transitionScene = find_child("TransitionScene")
	load("TransitionScene")
	transitionScene.transitionEnd.connect(loadMinigame)
	son_transition.play()


func loadMinigame():
	var sceneID: int = randi() % MINIGAME_SCENES_ARRAY.size()
	var path: String = MINIGAME_SCENES_ARRAY[sceneID]
	var minigameScene = load(path)
	minigame = minigameScene.instantiate()
	add_child(minigame)
	minigame.win.connect(minigameWon)
	minigame.lose.connect(minigameLost)
	#transitionScene.visible = false
	#if sceneID==2:
		#Camera2D.enabled= false

func minigameWon():
	print("you win")
	son_victoire.play()
	minigame.queue_free()
	Camera2D.enabled= true
	transitionScene.visible = true
	transitionScene.reload()

func minigameLost():
	print("you lost")
	son_defaite.play()
	health -= 1
	minigame.queue_free()
	Camera2D.enabled= true
	transitionScene.visible = true
	transitionScene.reload()
