extends Node2D

signal timeout
var quarters: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	quarters = find_children("Quarter*")
	for quarter in quarters:
		quarter.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !$"Minigame Timer".is_stopped():
		if $"Minigame Timer".time_left <= 3 * $"Minigame Timer".wait_time / 4:
			quarters[0].visible = true
		
		if $"Minigame Timer".time_left <= $"Minigame Timer".wait_time / 2:
			quarters[1].visible = true
		
		if $"Minigame Timer".time_left <= $"Minigame Timer".wait_time / 4:
			quarters[2].visible = true
		
		if $"Minigame Timer".time_left == 0:
			quarters[3].visible = true


func _on_ready_timer_timeout():
	$"Minigame Timer".start()


func _on_minigame_timer_timeout():
	timeout.emit()
