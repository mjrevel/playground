shader_type canvas_item;
uniform float earth_radius: hint_range(0.005, 0.2) = 0.1;
uniform vec3 earth_color: source_color;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV * 2.0 - 1.0;
	//COLOR = vec4(0);
	//COLOR.xy = uv;
	//COLOR.a = 1.0;
	
	// earth
	float earth_mask = step(length(uv), earth_radius);
	COLOR.a = earth_mask;
	COLOR.rgb = mix(COLOR.rgb, earth_color, earth_mask);
	
	// moon
	float moon_loc = distance(uv, vec2(cos(TIME), sin(TIME)));
	float moon_mask = step(moon_loc, earth_radius * 0.5);
	COLOR.a = earth_mask + moon_mask;
	COLOR.rgb = mix(COLOR.rgb, earth_color, moon_mask );
	
	// moon to the moon
	float moon_moon_loc = distance(vec2(cos(TIME), sin(TIME)), vec2(sin(TIME), cos(TIME)));
	float moon_moon_mask = step(moon_loc, earth_radius * 0.2);
	COLOR.a = earth_mask + moon_mask + moon_moon_mask;
	//COLOR.rgb = mix(COLOR.rgb, earth_color, earth_mask + moon_moon_mask);
	COLOR.rgb = mix(COLOR.rgb, earth_color, moon_moon_mask);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
