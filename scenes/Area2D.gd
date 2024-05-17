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
var maxVitesse=10
var vitesse
var zone:Area2D
var vector:Vector2
var timer_avance=-1
var distance_avance=15
@export var max_x=1000
@export var max_y=1000
@export var min_x=200
@export var min_y=200


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
	parent_node = get_parent().get_parent()
	_limit()

func _on_mouse_entered():
	drapeauxbool=true
	SceneValise._estPresent(parent_node.z_index,estChercher)
	

func _on_mouse_exited():
	drapeauxbool=false
	SceneValise._estAbscan(parent_node.z_index,estChercher)
	
func _avance(direction,vitesse):
	timer_avance=distance_avance
	if(direction==0):
		vector=Vector2(0,vitesse)
	if(direction==1):
		vector=Vector2(vitesse,0)
	if(direction==2):
		vector=Vector2(-vitesse,0)
	if(direction==3):
		vector=Vector2(0,-vitesse)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	_limit()
	if(timer_avance>-1):
		timer_avance-=1
		parent_node.position+=vector
	
	if(true):
		if (timer<20):#Timer
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
			SceneValise.toucher()
	
			
