extends Node2D

# Preload the object scenes 
@export var object_scenes : Array[PackedScene]

# Spawn rate
@export var SpawnInterval : float = 5.0

var last_rand_value : float = 0.0
var current_spawn_interval : float = 2.0

func _process(delta):
	current_spawn_interval -= delta
# Spawning mechanic
	if current_spawn_interval <= 0:
		spawn_random_object()
		current_spawn_interval = remap(Global.GameInstance.difficulty_factor, 1, 3, SpawnInterval, 1)

# Function to spawn a random object
func spawn_random_object():
	# Select a random object scene
	var rand_val = randi_range(0, object_scenes.size() - 1)
	
	while rand_val == last_rand_value:
		rand_val = randi_range(0, object_scenes.size() - 1)
	last_rand_value = rand_val
	
	var object_scene = object_scenes[rand_val]
	
	var instance : WeatherObj = object_scene.instantiate()
	instance.position.x = get_viewport_rect().size.x
	instance.position.y = -20
	# Add the instance to the scene
	add_child(instance)
