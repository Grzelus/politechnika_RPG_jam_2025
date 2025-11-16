extends CharacterBody2D

var is_in_goal := false
@onready var sprite_2d: Sprite2D = $Sprite2D

signal goal_reached

func _physics_process(delta: float) -> void:
	if is_in_goal == false:
		var vel : Vector2 = get_global_mouse_position() - global_position
		if vel.length() > 300:
			vel = vel.normalized() * 300
		velocity = vel
		move_and_slide()
		look_at(get_global_mouse_position())


func _on_ball_goal_area_entered(area: Area2D) -> void:
	is_in_goal = true
	emit_signal("goal_reached")
	sprite_2d.self_modulate = Color(0, 0, 0, 0.5)	
