extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D

@export var speed: float = 3.0
@export var hp: float = 100.0
@export var ATK: int = 3
@export var attack_radius: float = 5.0

var towers = []
var attack_timer: Timer
var avoidance_radius: float = 1.0

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
	add_to_group("enemies")
	attack_timer = Timer.new()
	attack_timer.wait_time = 1.0
	attack_timer.one_shot = false
	attack_timer.autostart = true
	add_child(attack_timer)
	
	nav_agent.avoidance_enabled = true
	nav_agent.radius = avoidance_radius

func _process(delta: float):
	if nav_agent.is_navigation_finished():
		return
	
	var next_location = nav_agent.get_next_path_position()
	var current_location = global_transform.origin
	var new_velocity = (next_location - current_location).normalized() * speed

	velocity = velocity.move_toward(new_velocity, delta * speed)

	for enemy in get_tree().get_nodes_in_group("enemies"):
		if enemy == self:
			continue
		var distance_to_enemy = global_transform.origin.distance_to(enemy.global_transform.origin)
		if distance_to_enemy < avoidance_radius:
			var avoidance_vector = (global_transform.origin - enemy.global_transform.origin).normalized()
			velocity += avoidance_vector * speed * delta

	move_and_slide()

func update_target_location(target_location: Vector3):
	nav_agent.target_position = target_location
