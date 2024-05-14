extends Node2D

var aiguille: Node2D
var active: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	aiguille = find_child("Aiguille")
	aiguille.set_rotation_degrees(-135)
	active = true

func _rotateAiguille(delta):
	aiguille.set_rotation(aiguille.get_rotation() + delta * 5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		_rotateAiguille(delta)
	
	if Input.is_action_just_pressed("LeftClick"):
		active = false
		if aiguille.get_rotation_degrees() <= 55 && aiguille.get_rotation_degrees() >= 30:
			print("win")
		elif aiguille.get_rotation_degrees() < 30:
			print("stalled")
	
	if aiguille.get_rotation_degrees() > 55:
		active = false
		print("bust")
