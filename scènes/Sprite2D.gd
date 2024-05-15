extends Sprite2D

@export var speed = 400
@export var rotation_speed = 1.5
var listAléatoire=[1,2,3,4]
var rotation_direction = 0
var velocity
var curseurListAléatoire=0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(listAléatoire[curseurListAléatoire]==1):
		position=position+Vector2(1,0)
	if(listAléatoire[curseurListAléatoire]==2):
		position=position+Vector2(0,1)
	if(listAléatoire[curseurListAléatoire]==3):
		position=position+Vector2(-1,0)
	if(listAléatoire[curseurListAléatoire]==4):
		position=position+Vector2(0,-1)
	position=position+Vector2(0,-1)
	curseurListAléatoire=curseurListAléatoire+1
	if(curseurListAléatoire==3):
		curseurListAléatoire=0
