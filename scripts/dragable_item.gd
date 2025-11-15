extends RigidBody2D

var dragging = false
var of = Vector2(0.0, 0.0)

func _process(_delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - of

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
		if event.is_action_pressed("left_click"):
			print("clicked")
			dragging = true
			of = get_global_mouse_position() - global_position
		if event.is_action_released("left_click"):
			dragging = false
