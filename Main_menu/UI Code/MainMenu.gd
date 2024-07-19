extends Node

@onready var start_button = $MainMenu/M/VB/Start
@onready var settings_button = $MainMenu/M/VB/Settings
@onready var quit_button = $MainMenu/M/VB/Quit

func _ready():
	start_button.pressed.connect(on_start_pressed)
	settings_button.pressed.connect(on_settings_pressed)
	quit_button.pressed.connect(on_quit_pressed)

func on_settings_pressed():
	get_tree().change_scene_to_file("res://Main_menu/UI Scenes/SettingsScene.tscn")

func on_start_pressed():
	get_tree().change_scene_to_file("res://Main_menu/UI Scenes/LevelSelect Visual/level_select.tscn")
	
func on_quit_pressed():
	get_tree().quit()
