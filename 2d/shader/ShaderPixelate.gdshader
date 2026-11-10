shader_type canvas_item;

uniform float progress: hint_range(0.0, 1.0);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	//vec2 scaled_uv = UV * 2.0 - vec2(progress, 0.1);
	//vec4 scaled_texture = texture(TEXTURE, scaled_uv);
	//vec2 mask = step(vec2(0), scaled_uv) * step(scaled_uv, vec2(1));
	//scaled_texture.a *= mask.x * mask.y;
	//COLOR = scaled_texture;
	
	//vec2 grid = vec2(4.0 * progress, 4.0 * progress);
	//vec2 pixel_uv = floor(UV * grid) / grid + ((1.0 / grid.x) / 2.0);
	//vec4 scaled_texture = texture(TEXTURE, pixel_uv);
	////COLOR = scaled_texture;
	//COLOR.rgb = vec3(pixel_uv, 0);
	
	///* Grid Only */
	//vec2 grid = floor(UV * 8.0);
	//float checker = mod(grid.x + grid.y, 2.0);
	//COLOR.a = checker;
	//COLOR.rgb = vec3(grid, 0.0);
	
	/* Pixelate With Offset*/
	vec2 grid = vec2(floor(50.0 * progress), floor(50.0 * progress));
	vec2 pixel_uv = floor(UV * grid) / grid + ((1.0 / grid.x) / 2.0);
	//vec2 pixel_uv = floor(UV * grid) / grid + mod(grid.x + grid.y, 2.0);
	vec4 scaled_texture = texture(TEXTURE, pixel_uv);
	COLOR = scaled_texture;
	//COLOR.rgb = vec3(pixel_uv, 0);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
