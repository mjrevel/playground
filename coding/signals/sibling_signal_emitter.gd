extends Node2D

signal hello(greetings)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#pass
	hello.emit("Greetings from Sibling")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass
	#hello.emit("Greetings from Sibling")
