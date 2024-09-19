extends Area2D
class_name WeatherObj

enum WeatherType{
	RAIN,
	SUN,
	SNOW
}

@export var Weather : WeatherType
@export var Sprite : Sprite2D

# Speed of the clouds movement
var speed = 150.0

func _process(delta):
	# Move clouds to the left
	position.x -= speed * delta

	# Check if the object has left the screen 
	if position.x < -get_viewport_rect().size.x: # -1000 outside the screen
		queue_free() 
	
	for body in get_overlapping_areas():
		if body is Character:
			print("Hit")
	
