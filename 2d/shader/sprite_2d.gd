extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(material, 'shader_parameter/CircleSize', 0.1, 1)
	tween.tween_property(material, 'shader_parameter/ImagePosition', Vector2(-5,1), 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
