extends CharacterBody2D

signal touched_mouse

func _physics_process(delta: float) -> void:
	var vel : Vector2 = get_global_mouse_position() - global_position
	if vel.length() < 1000:
		vel = vel.normalized() * 1000
	velocity = vel
	move_and_slide()
	look_at(get_global_mouse_position())

func _on_area_2d_mouse_entered() -> void:
	emit_signal("touched_mouse", self)
