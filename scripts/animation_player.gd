extends AnimationPlayer


func _on_area_2d_tophat_clicked() -> void:
	print("animator works")
	play("move")
	await get_tree().create_timer(2).timeout
	play("return")
