extends Node2D
class_name SceneValise

var intValiseRechercher=1
var vie=3
var x:int
var y:int
var randomiseColor:float


var max=100

var min=0

var instance
static var listCouche = []
static var finDePartie=false
static var coucheDeLaVallise=-1

# Called when the node enters the scene tree for the first time.
func _ready():
	_initialise() # Replace with function body.
	
func _initialise():
	var prefab_bleu = preload("res://scenes/ValiseBleu.tscn")
	var prefab_jaune= preload("res://scenes/ValiseJaune.tscn")
	var prefab_rouge= preload("res://scenes/ValiseRouge.tscn")
	for i in range(10):
		print("nouvelle valise dans SceneValise")
		var rng = RandomNumberGenerator.new()
		randomiseColor=randf()
		if(randomiseColor>0.5):
			instance = prefab_bleu.instantiate()
		else:
			instance = prefab_rouge.instantiate()

		add_child(instance)
		if(i == intValiseRechercher):
			get_child(0).get_child(0).get_child(1).estChercher=true
		instance.z_index=i
		x=rng.randi_range(min,max)
		y=rng.randi_range(min,max)
		instance.position= Vector2(x,y)
		instance.visible=true

func echec():
	print("defait")


func victoir():
	print("victoir")
	
static func toucher( valise, boolean):
	if(boolean):
		coucheDeLaVallise=valise
		print("trouver!")
	else:
		listCouche.append(valise)
	finDePartie=true
	print("Toucher !")

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if(finDePartie):
		for i in listCouche:
			print(i)
			print(coucheDeLaVallise)
			if(coucheDeLaVallise<i):
				echec()
		victoir()
		listCouche=[]
	finDePartie=false
	
