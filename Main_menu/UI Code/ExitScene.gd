extends Node

@onready var exit_button = $exit

func _ready():
	exit_button.pressed.connect(on_exit_pressed)

func on_exit_pressed():
	get_tree().quit()
