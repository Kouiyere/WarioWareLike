extends CharacterBody2D
@onready var anim= $AnimatedSprite2D
signal lose
# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("walk_enemy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision:= move_and_collide(Vector2(0,+2))
	if collision and collision.get_collider().name== "Player":
		collision.get_collider().no_defeat= true
		lose.emit()
		$AudioStreamPlayer2D.play()
		set_process(false)
