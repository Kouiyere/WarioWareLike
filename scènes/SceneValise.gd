extends Node2D
class_name SceneValise
var timer=0
var timer_limit=3000
var number_valise=0
signal win
signal lose
var blockbool=true
var intValiseRechercher=1
var x:int
var y:int
var randomiseColor:float
var timer_oclock
var max=200

var min=-200

var instance
var listCouche = []
var coucheDeLaVallise=-1

# Called when the node enters the scene tree for the first time.
func _ready():
	timer_oclock=find_child("Minigame Timer Clock")
	timer_oclock.timeout.connect(timeoutReached)
	_initialise() # Replace with function body.
	
func _initialise():
	var prefab_bleu = preload("res://scènes/ValiseBleu.tscn")
	var prefab_jaune = preload("res://scènes/ValiseJaune.tscn")
	var prefab_rouge = preload("res://scènes/ValiseRouge.tscn")
	var rng = RandomNumberGenerator.new()
	number_valise=rng.randi_range(5,20)
	intValiseRechercher=rng.randi_range(1,number_valise-1)
	for i in range(number_valise):
		print("nouvelle valise dans SceneValise")
		if( i ==intValiseRechercher ):
			instance = prefab_jaune.instantiate()
			#print("flghspegh")
		else:
			randomiseColor=randf()
			if(randomiseColor>0.5):
				instance = prefab_bleu.instantiate()
			else:
				instance = prefab_rouge.instantiate()
		add_child(instance)
		instance.z_index=i
		x=rng.randi_range(min,max)
		y=rng.randi_range(min,max)
		instance.position= Vector2(x,y)
		instance.visible=true
	
		
	
func toucher():
	for i in listCouche:
		if(coucheDeLaVallise<i):
			#print("defait")
			if(blockbool):
				lose.emit()
				blockbool=false
			
			
	if(len(listCouche)==0):
		#print("defait")
		if(blockbool):
			lose.emit()
	else:
		#print("victoir")
		if(blockbool):
			win.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _estPresent(valise, boolean):
	if(boolean):
		coucheDeLaVallise=valise
	listCouche.append(valise)
	#print(listCouche,coucheDeLaVallise)
	
func _estAbscan(valise,boolean):
	if(boolean):
		coucheDeLaVallise=-1
	listCouche.erase(valise)
	
func _process(delta):
	pass

func timeoutReached():
	lose.emit()
