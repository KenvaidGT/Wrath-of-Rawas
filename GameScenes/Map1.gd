extends Node3D

@onready var enemy_container: Node3D = $Enemy
@onready var timer: Timer = $Timer
var enemy_preload = preload("res://Enemies/Enemy.tscn")

func _ready():
	timer.connect("timeout", Callable(self, "_on_spawner_timeout"))

func _on_start_pressed():
	timer.start()

func _on_spawner_timeout():
	spawn_enemy()

func spawn_enemy():
	var enemy = enemy_preload.instantiate()
	enemy.position = Vector3(-3.323, 1, -6.616)
	enemy_container.add_child(enemy)
