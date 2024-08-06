extends Node3D

@export var attack_radius: float = 5.0
@export var attack_interval: float = 1.0
@export var damage: float = 10.0

@onready var radius_visualizer = $RadiusVisualizer
var attack_timer: Timer

func _ready():
	attack_timer = Timer.new()
	attack_timer.wait_time = attack_interval
	attack_timer.one_shot = false
	attack_timer.connect("timeout", Callable(self, "_on_attack_timeout"))
	add_child(attack_timer)
	attack_timer.start()
	
	update_radius_visualization()

func _on_attack_timeout():
	var enemies = get_enemies_in_radius(attack_radius)
	for enemy in enemies:
		if enemy.has_method("take_damage"):
			enemy.take_damage(damage)

func get_enemies_in_radius(radius: float) -> Array:
	var enemies_in_radius = []
	for enemy in get_tree().get_nodes_in_group("enemies"):
		if global_transform.origin.distance_to(enemy.global_transform.origin) <= radius:
			enemies_in_radius.append(enemy)
	return enemies_in_radius

func update_radius_visualization():
	var scale = attack_radius / radius_visualizer.get_mesh().get_aabb().size.x
	radius_visualizer.scale = Vector3(scale, scale, scale)
