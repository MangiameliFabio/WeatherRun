extends Node2D
class_name Game

@export var TimerManager : Node2D

var current_index = 0
var difficulty_factor: float = 1.0

var Player : Character
func _ready():
	Global.GameInstance = self

func _input(event):
	if event.is_action_pressed("ui_down"):
		finish_game()
	pass

func finish_game():
	TransitionManager.change_scene("res://UI/GameOver.tscn")
	
func _process(delta: float) -> void:
	difficulty_factor = remap(TimerManager.time_left,60, 0,1,3)
	
