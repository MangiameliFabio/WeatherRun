extends Node2D

# Speed of the clouds movement
var speed = 150.0

func _process(delta):
	# Move clouds to the left
	position.x -= speed * delta

	# Check if the object has left the screen 
	if position.x < -get_viewport_rect().size.x: # -1000 outside the screen
		queue_free()  
