extends CharacterBody2D

var selected= false
var no_defeat= false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func followMouse():
	position.x= get_global_mouse_position().x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if no_defeat== false:
		move_and_collide(Vector2(0,-2))
		if selected:
			followMouse()

func _unhandled_input(event):
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected= true
			print(selected)
		else:
			selected= false
