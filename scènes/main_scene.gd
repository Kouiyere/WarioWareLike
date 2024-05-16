extends Node2D
class_name Main

var intValiseRechercher=1
var vie=3
var x:int
var y:int
var min=0
var max=1000
var instance
static var listCouche = []
static var finDePartie=false
static var coucheDeLaVallise=-1
# Called when the node enters the scene tree for the first time.
func _ready():
	_initialise() # Replace with function body.
	
func _initialise():
	var prefab_bleu = preload("res://scènes/node_2d.tscn")
	var prefab_jaune= preload("res://scènes/ValiseJaune.tscn")
	var prefab_rouge= preload("res://scènes/valise_rouge.tscn")
	for i in range(10):
		print("nouvelle valise dans Main")
		var rng = RandomNumberGenerator.new()
		instance = prefab_bleu.instantiate()
		add_child(instance)
		if(i == intValiseRechercher):
			get_child(0).get_child(0).get_child(1).estChercher=true
		instance.z_index=i
		x=rng.randi_range(min,max)
		y=rng.randi_range(min,max)
		instance.position= Vector2(x,y)
		instance.visible=true

func echec():
	vie=vie-1
	listCouche=[]
	if(vie==0):
		defait()
		print("defait")

func defait():
	pass

func victoir():
	pass
	
static func toucher( valise, boolean):
	if(boolean):
		coucheDeLaVallise=valise
	else:
		listCouche.append(valise)
	finDePartie=true
	print("Toucher !")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(finDePartie):
		for i in listCouche:
			if(coucheDeLaVallise<i):
				print("echec")
				echec()
				pass
		victoir()
	finDePartie=false
