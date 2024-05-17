extends Node2D

signal win
signal lose

var jauge: Node2D
@export var speed: float
var clickArea: Area2D
var label: Label
var minigameTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	jauge = find_child("Jauge")
	clickArea = find_child("ClickableArea")
	label = find_child("RichTextLabel")
	minigameTimer = find_child("Minigame Timer Clock")
	minigameTimer.timeout.connect(timeoutReached)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"Ready Timer".is_stopped():
		clickArea.clicked.connect(moveJaugeUp)
		jauge.position.y += speed * delta
		
		if jauge.position.y > 175 || jauge.position.y < -175:
			lose.emit()

func moveJaugeUp():
	jauge.position.y -= 100

func timeoutReached():
	win.emit()
