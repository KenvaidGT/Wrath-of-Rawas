extends Control

var HP = 10
var Gold = 10
var Mana = 10



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
	print("You Lost")


func _on_win_pressed():
	print("You Won")
