extends Node2D

# Array to hold the objects 
var objects = []
var current_index = 0

func _ready():
	# Initialize objects array with references to objects
	objects.append($"/root/Node2D/Character/Object1")
	objects.append($"/root/Node2D/Character/Object2")
	objects.append($"/root/Node2D/Character/Object3")


	# Ensure only the first object is active at the start
	set_active_object(current_index)

func _input(event):
	# Check if the E key is pressed
	if event.is_action_pressed("switch_object"):
		# Cycle to the next object
		current_index = (current_index + 1) % objects.size()
		set_active_object(current_index)

func set_active_object(index):
	# Loop through all objects and set their visibility based on the active index
	for i in range(objects.size()):
		objects[i].visible = (i == index)
