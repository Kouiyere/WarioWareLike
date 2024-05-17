extends Node2D

signal win
signal lose

var jauge: Node2D
@export var speed: float
var clickArea: Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	jauge = find_child("Jauge")
	clickArea = find_child("ClickableArea")
	clickArea.clicked.connect(moveJaugeUp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	jauge.position.y += speed * delta
	
	if jauge.position.y > 175 || jauge.position.y < -175:
		lose.emit()

func moveJaugeUp():
	jauge.position.y -= 100
