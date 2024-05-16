extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(Vector2(0,+2))
	for index in get_slide_collision_count():
		var collision= get_slide_collision(index)
		if collision and collision.collider.name== "CollisionShape2D":
			Joueur.no_defeat= true
			print("perdu!")
