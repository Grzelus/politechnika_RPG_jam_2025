extends Area2D

@export var detector_id: String

signal correct_placement
signal left

func _ready() -> void:
	pass # Replace with function body.



func _on_body_entered(body: Node2D) -> void:
	print("entered")
	if "card_id" in body:
		if body.card_id == detector_id:
			emit_signal("correct_placement")



func _on_body_exited(body: Node2D) -> void:
	if "card_id" in body:
		if body.card_id == detector_id:
			emit_signal("left")
