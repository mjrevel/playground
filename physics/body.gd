extends Node2D

# Called when the node enters the scene tree for the first time.

var fixed_pos: Vector2

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	print(delta)
	
	
func _integrate_forces():
	pass
