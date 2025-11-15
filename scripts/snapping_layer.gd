extends Node2D

@onready var item: RigidBody2D = get_node_or_null("Dragable Item")
@onready var children = get_children()
var areas2D:= []

func snap():
	for detector in areas2D:
		var distance = detector.position.distance_to(item.position)
		if distance < 200:
				item.position = detector.position

func _ready() -> void:
	for child in children:
		areas2D.append(child)

func _process(_delta: float) -> void:
	snap()
