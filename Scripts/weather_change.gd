extends Node2D

# Preload the object scenes 
@export var object_scenes : Array[PackedScene]

# Spawn rate
var spawn_interval = 0.0
var spawn_timer = 0.0
var last_rand_value = 0

func _process(delta):
	spawn_timer += delta
# Spawning mechanic
	if spawn_timer >= spawn_interval:
		spawn_random_object()
		spawn_timer = 0.0
		spawn_interval = 1.5 * max(Global.GameInstance.TimerManager.time_left * 0.1, 2)

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
