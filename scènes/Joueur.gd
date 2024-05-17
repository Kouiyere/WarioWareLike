extends CharacterBody2D
class_name Joueur

signal win

var selected= false
static var no_defeat= false

# Called when the node enters the scene tree for the first time.
func _ready():
	print(self)
	print(get_children())
	$AnimatedSprite2D.play("walk_player")

func followMouse():
	position.x= get_global_mouse_position().x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if no_defeat== false:
		var collision:= move_and_collide(Vector2(0,-2))
		if selected:
			followMouse()
		if collision and collision.get_collider().name== "Fin":
			win.emit()
			set_process(false)

func _unhandled_input(event):
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected= true
			print(selected)
		else:
			selected= false
