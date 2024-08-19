extends Area3D

@export var speed: float = 200.0
@export var damage: float = 10.0
var target: Node3D


func _process(delta: float):
	if not target or not target.is_inside_tree():
		queue_free()
		return


	var direction = (target.global_transform.origin - global_transform.origin).normalized()
	translate(direction * speed * delta)

func _on_body_entered(body: Node3D):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		queue_free()
