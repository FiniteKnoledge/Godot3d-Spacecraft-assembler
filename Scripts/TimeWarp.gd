extends Control

@onready var h_slider: HSlider = $PanelContainer/VBoxContainer/Timewarp
@onready var number: Label = $PanelContainer/VBoxContainer/Number


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	number.text = str(h_slider.value)
	Engine.time_scale = h_slider.value
