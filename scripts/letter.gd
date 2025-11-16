extends Label

var letters: Array = ["T", "I", "L", "E", "S", "C", "R", "N"]
signal clicked

func _ready() -> void:
	text = letters[randi_range(0, len(letters)-1)]

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		text = letters[randi_range(0, len(letters)-1)]
		emit_signal("clicked")
