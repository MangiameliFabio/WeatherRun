extends Area2D
class_name Character

@export var Sprite : AnimatedSprite2D

var clothing_type : WeatherObj.WeatherType = WeatherObj.WeatherType.SUN

func _ready() -> void:
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
