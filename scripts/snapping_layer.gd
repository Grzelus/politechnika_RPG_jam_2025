extends Node2D

@onready var children = get_children()
var detectors:= []
var items:= []
var is_snapped = []
var number_of_correct = 0

func snap():
	for detector_index in range(detectors.size()):
		for item_index in range(items.size()):
			var distance = detectors[detector_index].position.distance_to(items[item_index].position)
			if distance < 200:
				if !is_snapped[detector_index]:
					items[item_index].position = detectors[detector_index].position
					is_snapped[detector_index] = true
				else:
					is_snapped[detector_index] = false
					

func _on_correct_placement():
	number_of_correct+=1
func _on_left():
	number_of_correct-=1
	

func _ready() -> void:
	for child in children:
		if is_instance_of(child, Area2D):
			detectors.append(child)
		if is_instance_of(child, RigidBody2D):
			items.append(child)
	for i in range(len(detectors)):
		is_snapped.append(false)
	print(is_snapped)
	for detector in detectors:
		detector.connect("correct_placement", Callable(self, "_on_correct_placement"))
		detector.connect("left", Callable(self,"_on_left"))
	
func _process(_delta: float) -> void:
	snap()
		
	if number_of_correct == len(detectors):
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
