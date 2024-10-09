extends Area2D
class_name WeatherObj

enum WeatherType{
	RAIN,
	SUN,
	SNOW
}

@export var Weather : WeatherType
@export var Sprite : AnimatedSprite2D
@export var MoodKillFactor : float = 3
@export var AudioPlayer : AudioStreamPlayer

# Speed of the clouds movement
var speed = 150.0

func  _ready() -> void:
	Sprite.play()

func _process(delta):
	# Move clouds to the left
	position.x -= speed * delta * Global.GameInstance.difficulty_factor

	# Check if the object has left the screen 
	if position.x < -get_viewport_rect().size.x: # -1000 outside the screen
		queue_free() 
	
	var collision_detected = false
	for body in get_overlapping_areas():
		if body is Character:
			collision_detected= true
			if not AudioPlayer.playing:
				AudioPlayer.play()
			if body.clothing_type == Weather:
				pass
			else:
				body.Happiness -= delta * MoodKillFactor * Global.GameInstance.difficulty_factor
				if body.Happiness <= 0:
					body.Happiness = 0
					Global.GameInstance.finish_game()
	
	if not collision_detected:
		if AudioPlayer.playing:
			AudioPlayer.stop()

				
	
