extends Node2D

var ball
var ball2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ball = $AnimatableBody2D
	ball2 = $RigidBody2D
	
	ball2.linear_velocity = Vector2(0, 1000)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#var ball = $AnimatableBody2D
	#ball.global_position += Vector2(0, 500 * delta)
	
func _physics_process(delta: float) -> void:
	var velocity = Vector2(0, 500 * delta)
	ball.sync_to_physics = true
	#ball.move_and_collide(velocity)
	ball.global_position += velocity
	
	
func _integrate_forces():
	pass
	#ball2.linear_velocity
