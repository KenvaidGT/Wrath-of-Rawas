extends Node3D

@onready var tower = $Tower

@onready var enemy_container: Node3D = $Enemy
@onready var timer: Timer = $Enemies/Spawner
var enemy_preload = preload("res://Enemies/Enemy.tscn")

func _physics_process(_delta):
	get_tree().call_group("Enemy" , "update_target_location" , tower.global_transform.origin)

func _on_start_pressed():
	timer.start()

func _on_spawner_timeout():
	spawn_enemy()

func spawn_enemy():
	var enemy = enemy_preload.instantiate()
	enemy.position = Vector3(randi_range(-3.323, 5), 3, -6.616)
	$Enemies.add_child(enemy)
