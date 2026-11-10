shader_type canvas_item;

uniform float size: hint_range(0.0, 0.5);
uniform float progress: hint_range(0.0, 1.0);
uniform sampler2D test_texture;

void vertex() {
	// Called for every vertex the material is visible on.
	
}

void fragment() {
	float diagonal = (UV.x + UV.y) / 2.0;
	float circle = distance(UV, vec2(0.5,0.5));
	COLOR.a *= step(progress, diagonal);
	vec4 test = texture(test_texture, UV);
	COLOR.rgb = test.xyz;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
