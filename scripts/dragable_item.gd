extends RigidBody2D

@export var texture: Texture2D
@export var card_id: String

@onready var sprite := get_node_or_null("Sprite2D")
var reverse = preload("res://assets/card_bg.png")
@onready var collision_shape = get_node_or_null("CollisionShape2D").shape
@onready var animation_player = get_node_or_null("Sprite2D/AnimationPlayer")

var dragging = false
var of = Vector2(0.0, 0.0)

func toggle_sprite():
	if sprite.texture == texture:
		animation_player.play("flip_1")
		await animation_player.animation_finished
		sprite.z_index = -100
		sprite.texture = reverse
		sprite.z_index = 0
		animation_player.play("flip_2")
		await animation_player.animation_finished
	else:
		animation_player.play("flip_1")
		await animation_player.animation_finished
		sprite.z_index = -100
		sprite.texture = texture
		sprite.z_index = 0
		animation_player.play("flip_2")
		await animation_player.animation_finished


func _process(_delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - of
		

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
		if event.is_action_pressed("left_click"):
			print("clicked")
			dragging = true
			of = get_global_mouse_position() - global_position
		if event.is_action_released("left_click"):
			dragging = false
		if event.is_action_pressed("right_click"):
			toggle_sprite()
func _ready() -> void:
	resize()
	
func resize():
	if texture:
		var texture_size = texture.get_size()
		sprite.texture = texture
		if collision_shape is RectangleShape2D:
			var collision_size = collision_shape.size
			var new_scale = collision_size / texture_size
			sprite.scale = new_scale
