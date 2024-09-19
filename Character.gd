extends Area2D
class_name Character

@export var Sprite : AnimatedSprite2D

func _ready() -> void:
	Sprite.animation = "Snow"
	Sprite.play()
