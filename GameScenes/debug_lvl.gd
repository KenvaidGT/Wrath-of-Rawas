extends Node3D

@onready var mana_house: Node3D = $Towers/Mana_house
@onready var main_house: Node3D = $Towers/Main_house
@onready var gold_house: Node3D = $Towers/Gold_house
@onready var lose_ui: Control = $EndGameUI
@onready var win_ui: Control = $WinGameUI
@onready var enemy_container: Node3D = $Enemies
@onready var timer: Timer = $Enemies/Spawner
@onready var timer2: Timer = $Enemies/Spawner2
@onready var game_ui: Node = $debug_Game_UI
@onready var nav_region: NavigationRegion3D = $NavigationRegion3D

var a = 0
var enemy_preload = preload("res://Enemies/Enemy.tscn")

func _ready():
	game_ui.connect("enemy_changed", Callable(self, "_on_enemy_changed"))
	nav_region.connect("navigation_mesh_changed", Callable(self, "_on_navigation_region_3d_navigation_mesh_changed"))

func _physics_process(_delta):
	get_tree().call_group("enemies", "update_target_location", mana_house.global_transform.origin)
	get_tree().call_group("enemies", "update_target_location", main_house.global_transform.origin)
	get_tree().call_group("enemies", "update_target_location", gold_house.global_transform.origin)

func _on_start_pressed():
	timer.start()

func _on_spawner_timeout():
	spawn_enemy()
	a -= 1
	if a <= 0:
		timer.stop()

func spawn_enemy():
	var enemy = enemy_preload.instantiate() as CharacterBody3D
	enemy.position = Vector3(-4, 0, -8)
	enemy_container.add_child(enemy)

func _on_enemy_changed(new_value):
	a = new_value

func _on_wall_pressed():
	_on_navigation_region_3d_navigation_mesh_changed()

func _on_navigation_region_3d_navigation_mesh_changed():
	if nav_region:
		bake_navigation_mesh()
		print("Navigation mesh has been baked and updated")

func bake_navigation_mesh():
	if nav_region:
		nav_region.bake_navigation_mesh()
