extends Node2D

signal win
signal lose

var aiguille: Node2D
var active: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	aiguille = find_child("Aiguille")
	aiguille.set_rotation_degrees(4.7)
	active = false

func _rotateAiguille(delta):
	aiguille.set_rotation(aiguille.get_rotation() + delta * 5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		_rotateAiguille(delta)
	
	if Input.is_action_just_pressed("LeftClick"):
		active = false
		if aiguille.get_rotation_degrees() <= 214 && aiguille.get_rotation_degrees() >= 158:
			win.emit()
		elif aiguille.get_rotation_degrees() < 158:
			lose.emit()
		elif aiguille.get_rotation_degrees() > 214:
			lose.emit()
	
	if aiguille.get_rotation_degrees() > 265:
		active = false
		lose.emit()


func _on_ready_timer_timeout():
	active = true
