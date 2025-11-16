extends Node2D

@onready var play: Button = get_node_or_null("Menu/Play")
@onready var settings: Button = get_node_or_null("Menu/Settings")
@onready var quit: Button = get_node_or_null("Menu/Quit")

func play_clicked() -> void:
	# get_tree().change_scene_to_file("res://scenes/levels/werka/level_3w.tscn")
	pass
	
func settings_clicked() -> void:
	var settings_scene = preload("res://scenes/settings.tscn").instantiate()
	add_child(settings_scene)
		
func quit_clicked() -> void:
	get_tree().quit()
	
func _ready() -> void:
	play.connect("pressed", Callable(self, "play_clicked"))
	play.disabled = true
	$TitleSprite.visible = false
	settings.connect("pressed", Callable(self, "settings_clicked"))
	quit.connect("pressed", Callable(self, "quit_clicked"))
	
	for child in $Title.get_children():
		child.connect("clicked", Callable(self, "check"))
	
	for child in $Screen.get_children():
		child.connect("clicked", Callable(self, "check"))

func check() -> void:
	if $Title/Letter1.text == "T" and $Title/Letter2.text == "I" and $Title/Letter3.text == "T" and $Title/Letter4.text == "L" and $Title/Letter5.text == "E" and $Screen/Letter1.text == "S" and $Screen/Letter2.text == "C" and $Screen/Letter3.text == "R" and $Screen/Letter4.text == "E" and $Screen/Letter5.text == "E" and $Screen/Letter6.text == "N":
		play.disabled = false
		$TitleSprite.visible = true
		$Title.queue_free()
		$Screen.queue_free()
