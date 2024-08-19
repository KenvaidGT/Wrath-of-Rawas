extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D

@export var speed: float = 3.0
@export var hp: float = 100.0
@export var attack_radius: float = 5.0
@export var avoid_radius: float = 2.0  
@export var gravity: float = -9.8

var attack_count = 0  # Количество ударов по башне
var spawn_position: Vector3 = Vector3.ZERO  # Позиция спавна

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
	spawn_position = global_transform.origin  # Сохраняем позицию спавна

func _process(delta: float):
	velocity.y += gravity * delta

	if nav_agent.is_navigation_finished():
		return

	if attack_count < 4:
		var next_location = nav_agent.get_next_path_position()
		var current_location = global_transform.origin
		var new_velocity = (next_location - current_location).normalized() * speed

		var avoid_force = Vector3.ZERO
		for enemy in get_tree().get_nodes_in_group("Enemy"):
			if enemy == self:
				continue
			var distance = current_location.distance_to(enemy.global_transform.origin)
			if distance < avoid_radius:
				avoid_force += (current_location - enemy.global_transform.origin).normalized() * (avoid_radius - distance)

		new_velocity += avoid_force.normalized() * speed

		velocity = velocity.move_toward(new_velocity, delta * speed)
		move_and_slide()
	else:
		var direction_to_spawn = (spawn_position - global_transform.origin).normalized()
		velocity = direction_to_spawn * speed
		move_and_slide()
		if global_transform.origin.distance_to(spawn_position) < 1.0:
			print("Enemy reached spawn point and is being removed.")
			queue_free()

func update_target_location(target_location: Vector3):
	nav_agent.target_position = target_location

func hit_tower():
	attack_count += 1
	print("Enemy attacked tower. Total attacks: ", attack_count)
	if attack_count >= 4:
		# Update the target location to spawn position
		update_target_location(spawn_position)
