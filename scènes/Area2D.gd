extends Area2D

var drapeauxbool : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	print("entrer")
	drapeauxbool=true

func _on_mouse_exited():
	print("sorti")
	drapeauxbool=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT and drapeauxbool:
			# Clic gauche de la souris
			#print("Clic gauche de la souris détecté à la position : ", event.position)
			Main.toucher(z_index,false)
	
			
