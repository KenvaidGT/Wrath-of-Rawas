extends Node2D

func _ready():
	$Level1.connect("pressed", Callable(self, "on_level1_pressed"))
	$Level2.connect("pressed", Callable(self, "on_level2_pressed"))
	$Level3.connect("pressed", Callable(self, "on_level3_pressed"))
	$Level4.connect("pressed", Callable(self, "on_level4_pressed"))
	$Exit.connect("pressed", Callable(self, "on_exit_pressed"))
	
func on_level1_pressed():
	get_tree().change_scene_to_file("res://GameScenes/debug_lvl.tscn")

func on_level2_pressed():
	get_tree().change_scene_to_file("res://GameScenes/Map1.tscn")

func on_level3_pressed():
	get_tree().change_scene_to_file("res://GameScenes/Map2.tscn")

func on_level4_pressed():
	get_tree().change_scene_to_file("res://GameScenes/Map3.tscn")
	
func on_exit_pressed():
	get_tree().change_scene_to_file("res://Main_menu/UI Scenes/MainMenu Visual/MainScene.tscn")

