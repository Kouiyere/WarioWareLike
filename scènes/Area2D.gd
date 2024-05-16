extends Area2D

var listAléatoire=[1,2,3,4]
var rotation_direction = 0
var velocity
var curseurListAléatoire=0
var timer=0
var drapeauxbool : bool
var estChercher=false
var parent_node

# Called when the node enters the scene tree for the first time.

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	parent_node = get_parent()

func _on_mouse_entered():
	drapeauxbool=true

func _on_mouse_exited():
	drapeauxbool=false
	
func _avance(direction,vitesse):
	if(direction==0):
		parent_node.position+=Vector2(0,vitesse)
	if(direction==1):
		parent_node.position+=Vector2(vitesse,0)
	if(direction==2):
		parent_node.position+=Vector2(-vitesse,0)
	if(direction==3):
		parent_node.position+=Vector2(0,-vitesse)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if (timer<100):
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
			Main.toucher(z_index,estChercher)
	
			
