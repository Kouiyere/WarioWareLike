extends Node2D
class_name SceneValise

var intValiseRechercher=1
var vie=3
var x:int
var y:int
var randomiseColor:float
static var blockbool=true

var max=200

var min=40

var instance
static var listCouche = []
static var finDePartie=false
static var coucheDeLaVallise=-1

# Called when the node enters the scene tree for the first time.
func _ready():
	_initialise() # Replace with function body.
	
func _initialise():
	var prefab_bleu = preload("res://scenes/ValiseBleu.tscn")
	var prefab_jaune = preload("res://scenes/ValiseJaune.tscn")
	var prefab_rouge = preload("res://scenes/ValiseRouge.tscn")
	var rng = RandomNumberGenerator.new()
	for i in range(10):
		
		print("nouvelle valise dans SceneValise")
		if( i == intValiseRechercher):
			instance = prefab_jaune.instantiate()
			print("flghspegh")
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
	
static func echec():
	if(blockbool):
		blockbool=true
		print("defait")


static func victoir():
	if(blockbool):
		blockbool=true
		print("victoir")
	
static func toucher():
	for i in listCouche:
		if(coucheDeLaVallise<i):
			echec()
	if(len(listCouche)==0):
		echec()
	else:
		victoir()

# Called every frame. 'delta' is the elapsed time since the previous frame.

static func _estPresent(valise, boolean):
	if(boolean):
		coucheDeLaVallise=valise
	listCouche.append(valise)
	print(listCouche,coucheDeLaVallise)
static func _estAbscan(valise,boolean):
	if(boolean):
		coucheDeLaVallise=-1
	listCouche.erase(valise)
	
func _process(delta):
	pass
	
