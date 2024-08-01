extends Node3D

@onready var mana_house = $Towers/Mana_house
@onready var main_house = $Towers/Main_house
@onready var gold_house = $Towers/Gold_house
@onready var lose_ui: Control = $EndGameUI
@onready var win_ui: Control = $WinGameUI
@onready var enemy_container: Node3D = $Enemy
@onready var timer: Timer = $Enemies/Spawner
@onready var enemy__1 = $"debug_Game_UI/M/VB2/Enemy_+1"
var enemy_preload = preload("res://Enemies/Enemy.tscn")


func _physics_process(_delta):
	if enemy__1 <= 0:
		timer.stop()

	get_tree().call_group("Enemy" , "update_target_location" , mana_house.global_transform.origin)
	get_tree().call_group("Enemy" , "update_target_location" , gold_house.global_transform.origin)
	get_tree().call_group("Enemy" , "update_target_location" , main_house.global_transform.origin)


func _on_start_pressed():
	timer.start()
	enemy__1 -= 1


func _on_spawner_timeout():
	spawn_enemy()


func spawn_enemy():
	var enemy = enemy_preload.instantiate()
	enemy.position = Vector3(-4, 0, -8)
	$Enemies.add_child(enemy)
