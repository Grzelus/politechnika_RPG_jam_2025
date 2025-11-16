extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var mouse_hover := false

signal tophat_clicked

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and mouse_hover == true:
		print("clicked")
		emit_signal("tophat_clicked")
		
func _on_mouse_entered() -> void:
	mouse_hover = true
	print("mouse entered ", mouse_hover)

func _on_mouse_exited() -> void:
	mouse_hover = false
	print("mouse exited ", mouse_hover)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "move":
		animated_sprite_2d.play("rabbit")
