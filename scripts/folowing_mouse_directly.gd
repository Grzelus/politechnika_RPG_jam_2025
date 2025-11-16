extends Path2D

func _ready() -> void:
	position = get_global_mouse_position()

func _process(_delta: float) -> void:
	position = get_global_mouse_position()	
