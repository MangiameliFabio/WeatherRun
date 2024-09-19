extends Node2D

# Preload the object scenes 
var object_scenes = [
	preload("res://clouds.tscn")
]

# Spawn rate
var spawn_interval = 0.0
var spawn_timer = 0.0

func _process(delta):
	spawn_timer += delta
# Spawning mechanic
	if spawn_timer >= spawn_interval:
		spawn_random_object()
		spawn_timer = 0.0
		spawn_interval = randf_range(3.0, 6.0)

# Function to spawn a random object
func spawn_random_object():
	# Select a random object scene
	var object_scene = object_scenes[randi() % object_scenes.size()]
	
	var instance : WeatherObj = object_scene.instantiate()

	var sprite = instance.Sprite
	var sprite_size = sprite.texture.get_size()
	
	# Set the object's position
	instance.position = Vector2(get_viewport_rect().size.x + sprite_size.x / 2,  get_viewport_rect().size.y / 4 )
	
	# Add the instance to the scene
	add_child(instance)
