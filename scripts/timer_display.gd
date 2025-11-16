extends Label

@onready var survival_timer: Timer = $"../survival_timer"

func _process(_delta: float) -> void:
	self.set_text(str(snapped(survival_timer.get_time_left(), 0.01)))
