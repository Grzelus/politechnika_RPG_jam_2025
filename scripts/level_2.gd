extends Node2D


@onready var button: Button = get_node_or_null("ColorRect/Button")


func on_click():

	get_tree().change_scene_to_file("res://scenes/Level_3.tscn")
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.connect("pressed", Callable(self, "on_click"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
