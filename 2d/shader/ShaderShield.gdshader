shader_type canvas_item;

uniform float bubble_opacity: hint_range(0.0, 0.5) = 0.25;
uniform float highlight_loc_x: hint_range(0.0, 1.0) = 0.0;
uniform float highlight_loc_y: hint_range(0.0, 1.0) = 0.0;
uniform float highlight_alpha: hint_range(0.0, 1.0) = 0.5;

uniform vec3 main_color: source_color;
uniform vec3 highlight_color: source_color;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float outer_bubble_distance = distance(UV, vec2(0.5, 0.5));
	float outer_bubble = step(outer_bubble_distance, 0.5);
	//float outer_bubble = smoothstep(0.0, 1.0, outer_bubble_distance);
	
	float inner_bubble_distance = distance(UV, vec2(0.5, 0.5));
	float inner_bubble = smoothstep(bubble_opacity, 1.0, inner_bubble_distance);
	float main_shape = inner_bubble * outer_bubble;
	
	float highlight_loc = distance(UV, vec2(highlight_loc_x, highlight_loc_y));
	//float highlight = smoothstep(0.5, 1.0, 1.0 - highlight_loc);
	float highlight = pow(1.0 - highlight_loc, 3.0) * highlight_alpha * main_shape;
	
	vec3 color = main_color * main_shape + highlight * highlight_color;
	color *= vec3(5.0);
	
	COLOR.a = highlight + main_shape;
	//COLOR.a = (main_shape * highlight * highlight_alpha) + (main_shape);
	COLOR.rgb = color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
