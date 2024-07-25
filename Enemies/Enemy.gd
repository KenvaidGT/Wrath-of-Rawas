extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D
var speed = 5.0

func _process(delta):
	var next_location = nav_agent.get_next_path_position()
	var current_location = global_transform.origin
	var new_velocity = (next_location - current_location).normalized() * speed

	velocity = velocity.move_toward(new_velocity, .25)
	move_and_slide()

func update_target_location(target_laoction):
	nav_agent.target_position = target_laoction
