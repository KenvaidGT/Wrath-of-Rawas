extends Control

@onready var game_ui: Control = $"."
@onready var wave_ui: Control = $wave_UI

func _ready():
	wave_ui.visible = false
	var start_button = $M/VB/Start
	start_button.pressed.connect(_on_start_pressed)

func _process(delta):
	pass

func _on_start_pressed():
	game_ui.visible = false
	wave_ui.visible = true

func _on_tower_1_pressed():
	print("Tower1_build")

func _on_tower_2_pressed():
	print("Tower2_build")

func _on_tower_3_pressed():
	print("Tower3_build")
