extends Node2D

@onready var play: Button = get_node_or_null("Menu/Play")
@onready var settings: Button = get_node_or_null("Menu/Settings")
@onready var quit: Button = get_node_or_null("Menu/Quit")

func play_clicked() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
	
func settings_clicked() -> void:
	var settings_scene = preload("res://scenes/settings.tscn").instantiate()
	add_child(settings_scene)
		
func quit_clicked() -> void:
	get_tree().quit()
	
func _ready() -> void:
	pass
