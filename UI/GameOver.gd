extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/VBoxContainer/MarginContainer2/Label2.text = "Your Hapiness: %d" % Global.GameInstance.Player.Happiness

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_restart_pressed():
	TransitionManager.change_scene("res://mainscene.tscn")

func _on_main_menu_pressed():
	TransitionManager.change_scene("res://UI/MainMenu.tscn")

func _on_quit_pressed():
	get_tree().quit()
