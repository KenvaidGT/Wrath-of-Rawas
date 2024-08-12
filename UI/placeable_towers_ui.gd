extends Control

@export var wall_activity_button_icon:Texture2D
@export var wall_activity_draggable:PackedScene

var cam:Camera3D
var _is_dragging:bool = false
var _draggable:Node
var _is_valid_location:bool = false
var _last_valid_location:Vector3
var RAYCAST_LENGTH:int = 100

func _on_wall_button_button_down():
	_is_dragging = true
	_draggable = wall_activity_draggable.instantiate()
	add_child(_draggable)
	
func _on_wall_button_button_up():
	_is_dragging = false
	
func _physics_process(_delta):
	if _is_dragging:
		
		var space_state = _draggable.get_world_3d().direct_space_state
		var mouse_pos:Vector2 = get_viewport().get_mouse_position()
		var origin:Vector3 = cam.project_ray_origin(mouse_pos)
		var end:Vector3 = origin + cam.project_ray_normal(mouse_pos) * RAYCAST_LENGTH
		var query = PhysicsRayQueryParameters3D.create(origin, end)
		query.collide_with_areas = true
		var rayResult:Dictionary = space_state.intersect_ray(query)
		if rayResult.size() > 0:
			var co:CollisionObject3D = rayResult.get("collider")
		else:
			_draggable.visible = false
			_is_valid_location = false
