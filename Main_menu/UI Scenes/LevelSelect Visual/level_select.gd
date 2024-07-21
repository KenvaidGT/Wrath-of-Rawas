extends Node2D

func _ready():
	$Level1.pressed.connect(self.on_level1_pressed)
	$Level2.pressed.connect(self.on_level2_pressed)
	$Level3.pressed.connect(self.on_level3_pressed)
	$Level4.pressed.connect(self.on_level4_pressed)
	$Exit.pressed.connect(self.on_exit_pressed)

func on_level1_pressed():
	var level_select = get_node("res://Main_menu/UI Scenes/LevelSelect Visual/level_select.tscn")
	if level_select:
		level_select.queue_free()
	var game_scene = load("res://GameScenes/Map1.tscn").instantiate()
	add_child(game_scene)

func on_level2_pressed():
	var level_select = get_node("res://Main_menu/UI Scenes/LevelSelect Visual/level_select.tscn")
	if level_select:
		level_select.queue_free()
	var game_scene = load("res://GameScenes/Map2.tscn").instantiate()
	add_child(game_scene)

func on_level3_pressed():
	var level_select = get_node("res://Main_menu/UI Scenes/LevelSelect Visual/level_select.tscn")
	if level_select:
		level_select.queue_free()
	var game_scene = load("res://GameScenes/Map3.tscn").instantiate()
	add_child(game_scene)

func on_level4_pressed():
	var level_select = get_node("res://Main_menu/UI Scenes/LevelSelect Visual/level_select.tscn")
	if level_select:
		level_select.queue_free()
	var game_scene = load("res://GameScenes/Map4.tscn").instantiate()
	add_child(game_scene)

func on_exit_pressed():
	var level_select = get_node("res://Main_menu/UI Scenes/LevelSelect Visual/level_select.tscn")
	if level_select:
		level_select.queue_free()
	var main_menu_scene = load("res://Main_menu/UI Scenes/MainMenu Visual/MainScene.tscn").instantiate()
	get_tree().root.add_child(main_menu_scene)
