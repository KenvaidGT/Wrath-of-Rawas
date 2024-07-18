extends Node2D

func _ready():
	pass

func _process(delta):
	pass

func on_start_pressed():
	pass
	

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Main_menu/UI Scenes/MainMenu Visual/MainScene.tscn")
