extends Control

@onready var lose_ui: Control = $EndGameUI
@onready var wave_ui: Control = $"."
@onready var win_ui: Control = $WinGameUI
@onready var MainMenu_button = $"WinGameUI/VBoxContainer/MainMenu button"
var HP = 10
var Gold = 10
var Mana = 10

func _ready():
	lose_ui.visible = false
	win_ui.visible = false
	
func _on_attack_pressed():
	print("Hp -1")
	HP -= 1
	print(HP)

func _on_steal_gold_pressed():
	print("Gold -1")
	Gold -= 1
	print(Gold)


func _on_steal_mana_pressed():
	print("Mana -1")
	Mana -= 1
	print(Mana)


func _on_lose_pressed():
	lose_ui.visible = true

func _on_win_pressed():
	win_ui.visible = true

