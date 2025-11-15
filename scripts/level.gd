extends Node2D

@onready var play: Button = get_node_or_null("Menu/Play")
@onready var settings: Button = get_node_or_null("Menu/Settings")
@onready var quit: Button = get_node_or_null("Menu/Quit")

func play_clicked() -> void:
	get_tree().change_scene_to_file("res://scenes/level.tscn")
	
func settings_clicked() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")
	
func quit_clicked() -> void:
	get_tree().quit()
	
func _ready() -> void:
	play.connect("pressed", Callable(self, "play_clicked"))
	settings.connect("pressed", Callable(self, "settings_clicked"))
	quit.connect("pressed", Callable(self, "quit_clicked"))
