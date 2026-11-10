extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../SiblingSignalEmitter".hello.connect(custom_func)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func custom_func(greetings: float):
	print(greetings)
