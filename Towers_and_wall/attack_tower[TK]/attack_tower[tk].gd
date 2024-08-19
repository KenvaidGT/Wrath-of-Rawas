extends Node3D

@export var attack_radius: float = 5.0
@export var attack_interval: float = 1.0
@export var damage: float = 10.0
@export var bullet_scene: PackedScene  # Для ссылки на сцену пули
@export var bullet_spawn_position: Node3D  # Позиция, из которой будет появляться пуля

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
	if enemies.size() > 0:
		var target = enemies[0]  # Атакуем первого врага в списке
		shoot_bullet(target)

func shoot_bullet(target: Node3D):
	if not target.is_inside_tree():
		print("Target is not inside the tree, cannot shoot.")
		return

	var bullet = bullet_scene.instantiate()
	bullet.target = target
	get_parent().add_child(bullet, true)  # deferred add_child

	# Переносим установку позиции в bullet после добавления в сцену
	bullet.global_transform.origin = bullet_spawn_position.global_transform.origin


func get_enemies_in_radius(radius: float) -> Array:
	var enemies_in_radius = []
	for enemy in get_tree().get_nodes_in_group("Enemy"):
		if global_transform.origin.distance_to(enemy.global_transform.origin) <= radius:
			enemies_in_radius.append(enemy)
	return enemies_in_radius

func update_radius_visualization():
	var scale = attack_radius / radius_visualizer.get_mesh().get_aabb().size.x
	radius_visualizer.scale = Vector3(scale, scale, scale)
