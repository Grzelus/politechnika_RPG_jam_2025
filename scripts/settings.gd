extends Control

@onready var back: Button = get_node_or_null("Back")

func back_clicked() -> void:
	get_tree().change_scene_to_file("res://scenes/level.tscn")
	
func _ready() -> void:
	back.connect("pressed", Callable(self, "back_clicked"))
