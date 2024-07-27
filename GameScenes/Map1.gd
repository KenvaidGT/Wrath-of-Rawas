extends Node3D

@onready var mana_house = $Towers/Mana_house
@onready var main_house = $Towers/Main_house
@onready var gold_house = $Towers/Gold_house
@onready var lose_ui: Control = $EndGameUI
@onready var win_ui: Control = $WinGameUI
@onready var enemy_container: Node3D = $Enemy
@onready var timer: Timer = $Enemies/Spawner
var enemy_preload = preload("res://Enemies/Enemy.tscn")

<<<<<<< HEAD
func _ready():
	lose_ui.visible = false
	win_ui.visible = false
=======

#building system
var build_mode = false
var build_valid = false
var build_location
var build_type
var mouse_position = get_viewport().get_mouse_position()


func _ready():
	var map_scene = ResourceLoader.load("res://GameScenes/Map1.tscn")
	var map_node = map_scene.instantiate()
	add_child(map_node)

	for button in get_tree().get_nodes_in_group("build_buttons"):
		button.connect("pressed", Callable(self, "initiate_build_mode").bind(button.get_name()))
	



func _process(delta):
	pass


func _unhandled_input(event):
	pass


func initiate_build_mode(tower_type):
	build_type = tower_type + "T1"
	build_mode = true
	get_node("Game_UI").set_tower_preview(build_type, mouse_position)

	


func update_tower_preview():
	pass


func cancel_build_mode():
	pass


func verify_and_build():
	pass

################################

>>>>>>> 7340b92e062fbd429a2b93e7cfb531e498108c21
func _physics_process(_delta):
	
	get_tree().call_group("Enemy" , "update_target_location" , mana_house.global_transform.origin)
	get_tree().call_group("Enemy" , "update_target_location" , gold_house.global_transform.origin)
	get_tree().call_group("Enemy" , "update_target_location" , main_house.global_transform.origin)


func _on_start_pressed():
	timer.start()

func _on_spawner_timeout():
	spawn_enemy()

func spawn_enemy():
	var enemy = enemy_preload.instantiate()
	enemy.position = Vector3(-4, 0, -8)
	$Enemies.add_child(enemy)


