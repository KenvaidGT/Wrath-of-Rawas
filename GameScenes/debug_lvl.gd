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
@onready var nav_region = $NavigationRegion3D
@onready var should_run = true

var b = 0
var a = 0
var enemy_preload = preload("res://Enemies/Enemy.tscn")

var enemy_hit_count = {}

func _ready():
	game_ui.connect("enemy_changed", Callable(self, "_on_enemy_changed"))
	nav_region.connect("navigation_mesh_changed", Callable(self, "_on_navigation_region_3d_navigation_mesh_changed"))

func _physics_process(_delta):
	get_tree().call_group("Enemy", "update_target_location", mana_house.global_transform.origin)
	get_tree().call_group("Enemy", "update_target_location", main_house.global_transform.origin)
	get_tree().call_group("Enemy", "update_target_location", gold_house.global_transform.origin)

func _on_start_pressed():
	timer.start()

func _on_spawner_timeout():
	spawn_enemy()
	a -= 1
	if a <= 0:
		timer.stop()

func spawn_enemy():
	var enemy = enemy_preload.instantiate()
	enemy.position = Vector3(-4, 0, -8)
	$Enemies.add_child(enemy)
	enemy_hit_count[enemy] = 0 

func _on_enemy_changed(new_value):
	a = new_value

func _on_wall_pressed():
	_on_navigation_region_3d_navigation_mesh_changed()

func _on_navigation_region_3d_navigation_mesh_changed():
	if nav_region:
		bake_navigation_mesh()

func bake_navigation_mesh():
	if should_run:
		nav_region.bake_navigation_mesh()

func _on_main_menu_button_pressed():
	should_run = false

func _on_main_menu_button_1_pressed():
	should_run = false

func on_enemy_hit_tower(enemy):
	if enemy_hit_count.has(enemy):
		enemy_hit_count[enemy] += 1
		if enemy_hit_count[enemy] >= 4:
			return_to_spawn_and_despawn(enemy)

func return_to_spawn_and_despawn(enemy):
	enemy.position = Vector3(-4, 0, -8)
	enemy.queue_free()
	enemy_hit_count.erase(enemy)
