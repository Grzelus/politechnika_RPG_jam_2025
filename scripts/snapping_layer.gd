extends Node2D

@onready var children = get_children()
var detectors:= []
var items:= []
var is_snapped := [false, false, false,false,false]

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
					

func _ready() -> void:
	for child in children:
		if is_instance_of(child, Area2D):
			detectors.append(child)
		if is_instance_of(child, RigidBody2D):
			items.append(child)
	for detector in detectors:
		is_snapped.append(false)
func _process(_delta: float) -> void:
	snap()
