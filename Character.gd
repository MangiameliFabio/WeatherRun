extends Area2D
class_name Character

@export var Sprite : AnimatedSprite2D
@export var Happiness : float
var clothing_type : WeatherObj.WeatherType = WeatherObj.WeatherType.SNOW

func _ready() -> void:
	await get_tree().process_frame
	Global.GameInstance.Player = self
	Sprite.animation = "Snow"
	Sprite.play()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("switch"):
		clothing_type += 1
		if clothing_type > 2:
			clothing_type = 0
		
		match clothing_type:
			WeatherObj.WeatherType.SUN: 
				Sprite.animation = "Sun"
			WeatherObj.WeatherType.SNOW: 
				Sprite.animation = "Snow"
			WeatherObj.WeatherType.RAIN: 
				Sprite.animation = "Rain"
		Sprite.play()
