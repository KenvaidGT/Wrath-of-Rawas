extends CharacterBody3D

var miner_count = 1
var upgrade_level = 1

@export var hp: float = 100.0

func take_damage(amount: int):
	hp -= amount
	if hp <= 0:
		die()
	
func die():
	queue_free()

