extends Node2D

func _ready():
	$Level1.connect("pressed", Callable(self, "on_level1_pressed"))
	$Level2.connect("pressed", Callable(self, "on_level2_pressed"))
	$Level3.connect("pressed", Callable(self, "on_level3_pressed"))
	$Level4.connect("pressed", Callable(self, "on_level4_pressed"))
	$Exit.connect("pressed", Callable(self, "on_exit_pressed"))
	
func on_level1_pressed():
	get_node("res://Main_menu/UI Scenes/LevelSelect Visual/level_select.tscn").queue_free()
	var game_scene = load("res://GameScenes/Map1.tscn").instantiate()
	add_child(game_scene)

func on_level2_pressed():
	get_node("res://Main_menu/UI Scenes/LevelSelect Visual/level_select.tscn").queue_free()
	var game_scene = load("res://GameScenes/Map2.tscn").instantiate()
	add_child(game_scene)

func on_level3_pressed():
	get_node("res://Main_menu/UI Scenes/LevelSelect Visual/level_select.tscn").queue_free()
	var game_scene = load("res://GameScenes/Map3.tscn").instantiate()
	add_child(game_scene)

func on_level4_pressed():
	get_node("res://Main_menu/UI Scenes/LevelSelect Visual/level_select.tscn").queue_free()
	var game_scene = load("res://GameScenes/Map4.tscn").instantiate()
	add_child(game_scene)

func on_exit_pressed():
	get_node("res://Main_menu/UI Scenes/LevelSelect Visual/level_select.tscn").queue_free()
	var game_scene = load("res://Main_menu/UI Scenes/MainMenu Visual/MainScene.tscn").instance()
	
