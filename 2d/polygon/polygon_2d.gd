extends Node2D

@onready var poly1 = $Polygon2D
@onready var poly2 = $Destructive

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Polygon2D/StaticBody2D/CollisionPolygon2D.polygon = poly1.polygon
	
	var tmp_arr1 = []
	var tmp_arr2 = []
	
	for point in poly1.polygon:
		tmp_arr1.append(poly1.global_position + point)
		
	for point in poly2.polygon:
		tmp_arr2.append(poly2.global_position + point)
		
	poly1.polygon = tmp_arr1
	poly2.polygon = tmp_arr2
	#poly2.to_local()
	var clipped_poly = Geometry2D.clip_polygons(poly1.polygon, poly2.polygon)
	
	tmp_arr1 = []
	
	for point in clipped_poly[0]:
		tmp_arr1.append(point - poly1.global_position)
		
	poly1.polygon = tmp_arr1
	
	#var clipped_poly = Geometry2D.merge_polygons(poly1.polygon, poly2.polygon)
	
	print(poly1.polygon)
	print(clipped_poly)
	
	poly1.polygon = tmp_arr1
	$Polygon2D/StaticBody2D/CollisionPolygon2D.set_deferred("polygon", tmp_arr1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func toworld() -> PackedVector2Array:
	var tmp_arr = []
	return tmp_arr
