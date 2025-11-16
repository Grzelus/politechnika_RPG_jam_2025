extends Node2D

@onready var play: Button = get_node_or_null("Menu/Play")
@onready var settings: Button = get_node_or_null("Menu/Settings")
@onready var quit: Button = get_node_or_null("Menu/Quit")

@onready var enemy_preload = preload("res://scenes/evil_ball.tscn")

func play_clicked() -> void:
	get_tree().change_scene_to_file("res://scenes/gabriel_scenes/levelG4.tscn")
	
func settings_clicked() -> void:
	var settings_scene = preload("res://scenes/settings.tscn").instantiate()
	add_child(settings_scene)
		
func quit_clicked() -> void:
	get_tree().quit()
	
func _ready() -> void:
	play.disabled = true
	play.connect("pressed", Callable(self, "play_clicked"))
	settings.connect("pressed", Callable(self, "settings_clicked"))
	quit.connect("pressed", Callable(self, "quit_clicked"))


var enemy_counter := 1
func _on_timer_timeout() -> void:
	if enemy_counter < 15:
		enemy_counter += 1
		var curr_enemy = enemy_preload.instantiate()
		curr_enemy.position = $Path2D/PathFollow2D/Marker2D.position
		curr_enemy.connect("touched_mouse", _on_evil_ball_touched_mouse)
		add_child(curr_enemy)
	else:
		$Path2D/Timer.queue_free()


func _on_evil_ball_touched_mouse(enemy: CharacterBody2D) -> void:
	enemy.global_position = $Path2D/PathFollow2D/Marker2D.global_position
	if($survival_timer.time_left > 0):
		$survival_timer.start($survival_timer.time_left + 1.0)


func _on_survival_timer_timeout() -> void:
	play.disabled = false
	for child in get_children():
		if child is CharacterBody2D:
			child.queue_free()
