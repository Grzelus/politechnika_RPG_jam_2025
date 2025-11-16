extends Node2D

@onready var play: Button = get_node_or_null("Menu/Play")
@onready var settings: Button = get_node_or_null("Menu/Settings")
@onready var quit: Button = get_node_or_null("Menu/Quit")

var score: int = 0

func play_clicked() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/werka/level_3w.tscn")
	
func settings_clicked() -> void:
	var settings_scene = preload("res://scenes/settings.tscn").instantiate()
	add_child(settings_scene)
		
func quit_clicked() -> void:
	get_tree().quit()
	
func _ready() -> void:
	$Menu.visible = false
	play.connect("pressed", Callable(self, "play_clicked"))
	play.disabled = true
	settings.connect("pressed", Callable(self, "settings_clicked"))
	quit.connect("pressed", Callable(self, "quit_clicked"))


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		score += 1
		$Score.text = str(score) + "/20"
		$Area2D.position.x = randi_range(60, 1660)
		$Area2D.position.y = randi_range(150, 830)
	if score >= 20:
		$Menu.visible = true
		$Area2D.position.x = 60
		$Area2D.position.y = 830
		$Score.text = "20/20"
		play.disabled = false
