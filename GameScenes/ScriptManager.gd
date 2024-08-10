extends Node3D

@export var wall_scene: PackedScene

func _ready():
	# Example of dynamically adding a wall
	var wall_instance = wall_scene.instantiate()
	wall_instance.transform.origin = Vector3(0, 1, 0) # Position the wall
	add_child(wall_instance)
