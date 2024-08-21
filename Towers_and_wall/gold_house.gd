extends Node3D

@onready var detection_area = $Area3D
@onready var attack_timer = Timer.new()

func _ready():
	if detection_area:
		detection_area.connect("body_entered", Callable(self, "_on_enemy_entered"))
		detection_area.connect("body_exited", Callable(self, "_on_enemy_exited"))
	else:
		print("Error: DetectionArea not found or not properly set.")
	
	attack_timer.wait_time = 1.0
	attack_timer.connect("timeout", Callable(self, "_on_attack_timer_timeout"))
	add_child(attack_timer)

var enemies_in_area = []

func _on_enemy_entered(body: Node):
	if body.is_in_group("Enemy"):
		print("Enemy detected: ", body.name)
		enemies_in_area.append(body)
		if attack_timer.is_stopped():
			attack_timer.start()

func _on_enemy_exited(body: Node):
	if body.is_in_group("Enemy"):
		print("Enemy left: ", body.name)
		enemies_in_area.erase(body)
		if enemies_in_area.size() == 0:
			attack_timer.stop()

func _on_attack_timer_timeout():
	for enemy in enemies_in_area:
		if is_instance_valid(enemy):
			enemy.hit_tower()
