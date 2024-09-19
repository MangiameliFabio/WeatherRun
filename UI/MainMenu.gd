extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_pressed():
	TransitionManager.change_scene("res://mainscene.tscn")

func _on_quit_pressed():
	get_tree().quit()
