extends Node2D

# Speed of the background movement
var speed: float = 200.0
# Define the variables without specifying types directly
var background1
var background2
var initial_position1
var initial_position2

func _ready():
	# Assign the background sprites using node paths
	background1 = $Background1
	background2 = $Background2
	
	initial_position1 = background1.position.x
	initial_position2 = background2.position.x
	

func _process(delta: float):
	# Move the backgrounds to the left
	background1.position.x -= speed * delta
	background2.position.x -= speed * delta
	print("Lol")

	# Reset position when one background goes off-screen
	if background1.position.x < -initial_position1:
		background1.position.x = initial_position2
	if background2.position.x < -initial_position1:
		background2.position.x = initial_position2
