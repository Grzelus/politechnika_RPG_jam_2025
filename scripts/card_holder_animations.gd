extends AnimatedSprite2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	$Timer.start(5.0 + randf_range(1, 10))


func _on_timer_timeout() -> void:
	play("blink")
	$Timer.start(5.0 + randf_range(1, 10))
