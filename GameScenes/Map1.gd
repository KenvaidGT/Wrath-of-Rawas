extends Node3D

@onready var enemy_container: Node3D = $Enemy
@onready var timer: Timer = $Enemies/Spawner
var enemy_preload = preload("res://Enemies/Enemy.tscn")

func _on_start_pressed():
	if timer != null:
		timer.start()
	else:
		print("Timer node not found!2")

func _on_spawner_timeout():
	spawn_enemy()

func spawn_enemy():
	var enemy = enemy_preload.instantiate()
	enemy.position = Vector3(randi_range(-3.323, 5), 1, -6.616)
	$Enemies.add_child(enemy)
