extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	set_text("Ready")

func _on_label_timer_timeout():
	set_text("Click to stop")
