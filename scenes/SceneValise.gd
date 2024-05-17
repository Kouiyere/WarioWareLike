extends Node2D
class_name SceneValise

signal win
signal lose

var intValiseRechercher=1
var x:int
var y:int
var randomiseColor:float

var max=200

var min=40

var instance
var listCouche = []
var coucheDeLaVallise=-1

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
	
		
	
func toucher():
	for i in listCouche:
		if(coucheDeLaVallise<i):
			lose.emit()
	if(len(listCouche)==0):
		lose.emit()
	else:
		win.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _estPresent(valise, boolean):
	if(boolean):
		coucheDeLaVallise=valise
	listCouche.append(valise)
	print(listCouche,coucheDeLaVallise)
	
func _estAbscan(valise,boolean):
	if(boolean):
		coucheDeLaVallise=-1
	listCouche.erase(valise)
	
func _process(delta):
	pass
	
