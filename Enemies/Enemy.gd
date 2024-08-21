extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D

@export var speed: float = 3.0
@export var hp: float = 100.0
@export var attack_radius: float = 5.0
@export var avoid_radius: float = 2.0  
@export var gravity: float = -9.8

var attack_count = 0
var spawn_position: Vector3 = Vector3.ZERO
var returning_to_spawn = false

func take_damage(amount: float):
	hp -= amount
	print("Enemy took damage: ", amount)
	print("Enemy HP remaining: ", hp)
	if hp <= 0:
		die()

func die():
	print("Enemy died")
	queue_free()

func _ready():
	add_to_group("Enemy")
	spawn_position = global_transform.origin

func _process(delta: float):
	velocity.y += gravity * delta

	if not nav_agent.is_navigation_finished():
		var next_location = nav_agent.get_next_path_position()
		var new_velocity = (next_location - global_transform.origin).normalized() * speed
		velocity = velocity.move_toward(new_velocity, delta * speed)
		move_and_slide()
	else:
		if returning_to_spawn and global_transform.origin.distance_to(spawn_position) < 1.0:
			print("Enemy reached spawn point and is being removed.")
			queue_free()

func update_target_location(target_location: Vector3):
	if not returning_to_spawn:
		nav_agent.target_position = target_location

func hit_tower():
	if attack_count < 4:
		attack_count += 1
		print("Enemy attacked tower. Total attacks: ", attack_count)
	else:
		if not returning_to_spawn:
			returning_to_spawn = true
			update_target_location(spawn_position)

func is_returning_to_spawn() -> bool:
	return returning_to_spawn
