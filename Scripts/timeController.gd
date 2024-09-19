extends Node2D

var time_left:float = 0.0

var timer_label: Label

@export var happiness_label: Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start() 
	time_left = $Timer.wait_time 
	timer_label = $Time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Timer.time_left > 0:
		time_left = $Timer.time_left 
		timer_label.text = "Time Left: %.2f" % time_left 
	else:
		timer_label.text = "Time's up!"  
	
	happiness_label.text = "Happiness %d" % Global.GameInstance.Player.Happiness




func _on_Timer_timeout():
	Global.GameInstance.finish_game()
	print("Timer finished!")
