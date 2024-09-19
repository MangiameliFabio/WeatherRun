extends Node2D

@export var Background1 : Sprite2D
@export var Background2 : Sprite2D

# Speed of the background movement
var speed: float = 200.0

# Backgrounds inititialization
var initial_position1
var initial_position2

func _ready():
	# Assign the background sprites 
	initial_position1 = Background1.position.x
	initial_position2 = Background2.position.x
	
	var sprite_end_pos_1 := Background1.position.x + Background1.texture.get_width() / 2
	var sprite_end_pos_2 := Background2.position.x + Background2.texture.get_width() / 2
	
func _process(delta: float):
	# Move the backgrounds to the left
	Background1.position.x -= speed * delta
	Background2.position.x -= speed * delta
	
	
	print(Background1.position.x + Background1.texture.get_width() * 10)
	# Reset position when one background goes off-screen
	if 0 > Background1.position.x + Background1.texture.get_width() * 10:
		Background1.position.x = Background2.position.x + Background2.texture.get_width()
	if 0 > Background2.position.x + Background2.texture.get_width() * 10:
		Background2.position.x = Background1.position.x + Background1.texture.get_width()
		

	
