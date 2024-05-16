extends Area2D

var listAléatoire=[1,2,3,4]
var listAléatoireInitialisation=[]
var rotation_direction = 0
var velocity
var curseurListAléatoire=0
var timer=0
var drapeauxbool : bool
@export var estChercher=false
var parent_node
var rng = RandomNumberGenerator.new()
var min=0
var max=4
var direction
var maxVitesse=0
var vitesse
var zone:Area2D
 
@export var max_x=100
@export var max_y=100
@export var min_x=0
@export var min_y=0


# Called when the node enters the scene tree for the first time.

func _limit():
	if(parent_node.position.x>max_x):
		parent_node.position.x=max_x
	if(parent_node.position.x<min_x):
		parent_node.position.x=min_x
	if(parent_node.position.y>max_y):
		parent_node.position.y=max_y
	if(parent_node.position.y<min_y):
		parent_node.position.y=min_y

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	parent_node = get_parent()
	_limit()

func _on_mouse_entered():
	drapeauxbool=true

func _on_mouse_exited():
	drapeauxbool=false
	
func _avance(direction,vitesse):
	if(direction==0):
		parent_node.position+=Vector2(0,vitesse)
		_limit()
	if(direction==1):
		parent_node.position+=Vector2(vitesse,0)
		_limit()
	if(direction==2):
		parent_node.position+=Vector2(-vitesse,0)
		_limit()
	if(direction==3):
		parent_node.position+=Vector2(0,-vitesse)
		_limit()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if(true):
		if (timer<100):#Timer
			timer+=1
		else:
			timer=0
			direction=rng.randi_range(min,max)
			vitesse=rng.randi_range(min,maxVitesse)
			_avance(direction,vitesse)
	if(false):
		if (timer<100):#Timer
			timer+=1
		else:
			timer=0
			if(listAléatoire[curseurListAléatoire]==1):
				_avance(0,1)
			if(listAléatoire[curseurListAléatoire]==2):
				_avance(1,1)
			if(listAléatoire[curseurListAléatoire]==3):
				_avance(2,1)
			if(listAléatoire[curseurListAléatoire]==4):
				_avance(3,1)
			#position=position+Vector2(0,-1)
			curseurListAléatoire=curseurListAléatoire+1
			#print("avance")
			if(curseurListAléatoire==4):
				curseurListAléatoire=0

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT and drapeauxbool:
			# Clic gauche de la souris
			#print("Clic gauche de la souris détecté à la position : ", event.position)
			SceneValise.toucher(z_index,estChercher)
	
			
