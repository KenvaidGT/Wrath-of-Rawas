extends CharacterBody3D

const SPEED = 5.0
var ATK = 10
var HP = 150

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	velocity.y -= gravity * delta
	move_and_slide()
