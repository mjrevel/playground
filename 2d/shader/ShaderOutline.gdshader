shader_type canvas_item;

uniform vec4 line_color: source_color = vec4(1.0);
uniform float line_thickness: hint_range(0.0, 1.0) = 0.5;
const float max_line_thickness = 4.0;

void vertex() {
	// Called for every vertex the material is visible on.
	//UV.x += .06;
}

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	vec2 size = TEXTURE_PIXEL_SIZE * line_thickness * max_line_thickness;
	float outline = color.a;
	for(float x = -1.0; x <= 1.0; x++) {
		for(float y = -1.0; y <= 1.0; y++) {
			vec2 offset = vec2(x, y) * size;
			outline += texture(TEXTURE, UV + offset).a;
		}
	}
	outline = min(outline, 1.0); // normalize values over 1
	//COLOR = mix(color, line_color, outline);
	COLOR = mix(color, line_color, outline - color.a);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
