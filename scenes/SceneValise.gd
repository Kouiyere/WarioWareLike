extends Node2D
class_name SceneValise

var intValiseRechercher=1
var vie=3
var x:int
var y:int
var randomiseColor:float


var max=100

var min=40

var instance
static var listCouche = []
static var finDePartie=false
static var coucheDeLaVallise=-1

# Called when the node enters the scene tree for the first time.
func _ready():
	_initialise() # Replace with function body.
	
func _initialise():
	var prefab_bleu = preload("res://valise.tscn")
	for i in range(0):
		print("nouvelle valise dans SceneValise")
		var rng = RandomNumberGenerator.new()
		randomiseColor=randf()
		instance = prefab_bleu.instantiate()
		if(randomiseColor>0.5):
			instance.texture=load("res://graphismes/valise rouge.svg")

		add_child(instance)
		if(i == intValiseRechercher and false):
			get_child(0).estChercher=true
			
		#instance.z_index=i
		x=rng.randi_range(min,max)
		y=rng.randi_range(min,max)
		instance.position= Vector2(x,y)
		#instance.visible=true

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
	
