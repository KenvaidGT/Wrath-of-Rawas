extends Node

@onready var start_button = $MainMenu/M/VB/Start
@onready var quit_button = $MainMenu/M/VB/Quit

func _ready():
	start_button.pressed.connect(on_start_pressed)
	quit_button.pressed.connect(on_quit_pressed)

func on_start_pressed():
	$MainMenu.queue_free()
	var game_scene = load("res://Main_menu/level_select.tscn").instantiate()
	add_child(game_scene)
	
func on_quit_pressed():
	get_tree().quit()
