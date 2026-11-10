extends CanvasLayer

# Signals

# programmers - think of this as a prototype
# objects that emit this signal must match its signature
signal custom_signal(a, b, c)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.update_ui.connect(_local_func_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _local_func_name(a):
	$LabelLogo.text = a


func _on_button_start_pressed() -> void:
	custom_signal.emit("Button was pressed", 1, 2)
	SignalBus.custom_signal_bus.emit("Button was pressed", 3)
