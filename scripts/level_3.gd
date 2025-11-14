extends Node2D


@onready var button: Button = get_node_or_null("BackGround/Button")
@onready var sensor: Area2D = get_node_or_null("BackGround/Area2D")

func on_entered_killzone(body: Node):
	if body.name != "Title":
		return
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	

func on_click():
		pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.connect("pressed", Callable(self, "on_click"))
	sensor.connect("body_entered", Callable(self,"on_entered_killzone"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
