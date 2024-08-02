extends Node3D

@onready var mana_house = $Towers/Mana_house
@onready var main_house = $Towers/Main_house
@onready var gold_house = $Towers/Gold_house
@onready var lose_ui: Control = $EndGameUI
@onready var win_ui: Control = $WinGameUI
@onready var enemy_container: Node3D = $Enemy
@onready var timer = $Enemies/Spawner
@onready var timer2 = $Enemies/Spawner2
@onready var game_ui = $debug_Game_UI 
var a = 0

var enemy_preload = preload("res://Enemies/Enemy.tscn")

func _ready():
	game_ui.connect("enemy_changed", Callable(self, "_on_enemy_changed"))

func _physics_process(_delta):
	

	get_tree().call_group("Enemy", "update_target_location", main_house.global_transform.origin)
	get_tree().call_group("Enemy", "update_target_location", mana_house.global_transform.origin)
	get_tree().call_group("Enemy", "update_target_location", gold_house.global_transform.origin)
	
func _on_start_pressed():
	timer.start()

func _on_spawner_timeout():
	spawn_enemy()

	a -= 1
	if a <= 0:
		timer.stop()
	#print(a)

func spawn_enemy():
	var enemy = enemy_preload.instantiate()
	enemy.position = Vector3(-4, 0, -8)
	$Enemies.add_child(enemy)

func _on_enemy_changed(new_value):
	a = new_value
