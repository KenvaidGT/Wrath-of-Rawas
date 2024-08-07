extends Node2D

func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://GameScenes/Map1.tscn")

func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://GameScenes/Map2.tscn")

func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://GameScenes/Map3.tscn")

func _on_debug_lvl_pressed():
	get_tree().change_scene_to_file("res://GameScenes/debug_lvl.tscn")

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Main_menu/UI Scenes/MainMenu Visual/MainScene.tscn")
