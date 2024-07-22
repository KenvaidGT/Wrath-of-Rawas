extends Node

@onready var exit_button = $exit

func _ready():
	exit_button.pressed.connect(on_exit_pressed)

func on_exit_pressed():
	get_tree().change_scene_to_file("res://Main_menu/UI Scenes/MainMenu Visual/MainScene.tscn")
