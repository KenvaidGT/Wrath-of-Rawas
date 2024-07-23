extends Control

@onready var game_ui: Control = $"."
@onready var wave_ui: Control = $wave_UI
var enemy = 0

func _ready():
	wave_ui.visible = false
	var start_button = $M/VB/Start

func _on_start_pressed():
	game_ui.visible = false
	wave_ui.visible = true
	
func _on_tower_1_pressed():
	print("Tower1_build")

func _on_tower_2_pressed():
	print("Tower2_build")

func _on_tower_3_pressed():
	print("Tower3_build")

func _on_enemy_1_pressed():
	enemy += 1
	print(enemy)

func _on_delet_tower_pressed():
	print("Delet_tower")

func _on_wall_pressed():
	print("Wall")
