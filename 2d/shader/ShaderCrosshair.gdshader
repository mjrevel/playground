shader_type canvas_item;

uniform float center_size: hint_range(0.0, 1.0) = 0.5;
uniform float circle_width: hint_range(0.0, 1.0) = 0.5;
uniform float circle_distance: hint_range(0.0, 1.0) = 0.5;
uniform float crosshair_distance: hint_range(0.0, 1.0) = 0.25;
uniform float crosshair_length: hint_range(0.0, 1.0) = 0.5;
uniform float crosshair_width: hint_range(0.0, 1.0) = 0.5;

void vertex() {
	
}

vec4 create_circles2(vec2 uv, vec4 color) {
	color.rgb = vec3(1);
	//float circle = distance(UV, vec2(0.5));
	//COLOR.a = step(circle, center_size * 0.1);
	float rect1_size = distance(uv.x, 0.5);
	float rect1 = step(rect1_size, .01);
	float rect2_size = distance(uv.y, 0.5);
	float rect2 = step(rect2_size, .01);
	
	float rect_sub_thickness = 0.02;
	float rect1_sub_size = distance(uv.y, rect_sub_thickness);
	float rect1_sub = step(rect1_sub_size, rect_sub_thickness);
	float rect1_sub_size_1 = distance(uv.y, .9);
	float rect1_sub_1 = step(rect1_sub_size_1, .1);
	float rect2_sub_size = distance(uv.x, rect_sub_thickness);
	float rect2_sub = step(rect2_sub_size, rect_sub_thickness);
	
	color.a = rect1 + rect2 + rect2_sub + rect1_sub_1;
	//color.a = rect1 - rect1_sub + rect2 - rect2_sub;
	
	return color;
}

vec4 create_circles(vec2 uv, vec4 color) {
	vec2 center_distance = vec2(0.5) + crosshair_distance;
	color.rgb = vec3(1);
	//float circle = distance(UV, vec2(0.5));
	//COLOR.a = step(circle, center_size * 0.1);
	float outer_circle = step(distance(uv, vec2(0.5)), circle_distance);
	float inner_circle = step(distance(uv, vec2(0.5)), circle_distance - circle_width);
	float inside_circle = step(distance(uv, vec2(0.5)), center_size * 0.1);
	
	float cross_cutout = min(step(distance(uv.x, 0.5), .06) + step(distance(uv.y, 0.5), .06), 1.0);
	
	float h_width = step(distance(uv.x, center_distance.x), crosshair_length * 0.25)
					+ step(distance(1.0 - uv.x, center_distance.x), crosshair_length * 0.25);
	float h_height = step(distance(uv.y, 0.5), crosshair_width * 0.02);
	
	float v_width = step(distance(uv.y, center_distance.y), crosshair_length * 0.25)
					+ step(distance(1.0 - uv.y, center_distance.y), crosshair_length * 0.25);
	float v_height = step(distance(uv.x, 0.5), crosshair_width * 0.02);
	//color.a = rect1 + rect2;
	
	color.a = inside_circle + max(outer_circle - inner_circle - cross_cutout, 0.0);
	color.a += h_width * h_height + v_width * v_height;

	
	return color;
}

void fragment() {
	COLOR = create_circles(UV, COLOR);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
