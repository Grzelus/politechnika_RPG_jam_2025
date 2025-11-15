extends Node2D

@onready var back: Button = get_node_or_null("Back")

func back_clicked() -> void:
	queue_free()
	
func _ready() -> void:
	back.connect("pressed", Callable(self, "back_clicked"))
