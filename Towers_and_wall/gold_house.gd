extends Node3D

@onready var detection_area = $Area3D

func _ready():
	if detection_area:
		detection_area.connect("body_entered", Callable(self, "_on_enemy_entered"))
	else:
		print("Error: DetectionArea not found or not properly set.")

func _on_enemy_entered(body: Node):
	if body.is_in_group("Enemy"):
		print("Enemy detected:", body.name)
		body.hit_tower()
