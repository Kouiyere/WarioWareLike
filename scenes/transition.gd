extends Node2D

signal transitionEnd
# Called when the node enters the scene tree for the first time.

func _on_timer_timeout():
	transitionEnd.emit()


func reload():
	$Timer.start()
