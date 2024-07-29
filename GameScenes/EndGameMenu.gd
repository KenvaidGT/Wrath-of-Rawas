extends Control


@onready var MainMenu_button = $"VBoxContainer/MainMenu button"
 
func _ready():
	MainMenu_button.pressed.connect(_on_main_menu_button_pressed)


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://Main_menu/UI Scenes/MainMenu Visual/MainScene.tscn")
