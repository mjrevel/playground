shader_type canvas_item;

uniform sampler2D noise_texture : repeat_enable, filter_linear;
uniform vec4 cloud_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 sky_color : source_color = vec4(0.2, 0.5, 0.8, 1.0);

uniform vec2 speed1 = vec2(0.03, 0.01);
uniform vec2 speed2 = vec2(0.01, 0.02);

uniform float cloud_density : hint_range(0.0, 1.0) = 0.4;
uniform float cloud_feather : hint_range(0.0, 1.0) = 0.3;

void fragment() {
    // Scroll UVs over time for two different layers
    vec2 uv1 = UV + TIME * speed1;
    vec2 uv2 = UV + TIME * speed2;
    
    // Sample the noise texture
    float noise1 = texture(noise_texture, uv1).r;
    float noise2 = texture(noise_texture, uv2).r;
    
    // Combine the noise layers for complexity
    float combined_noise = noise1 * noise2;
    
    // Create smooth thresholds for the clouds using smoothstep
    float cloud_mask = smoothstep(cloud_density, cloud_density + cloud_feather, combined_noise);
    
    // Mix the sky color and cloud color based on the mask
    vec4 final_color = mix(sky_color, cloud_color, cloud_mask);
    
    COLOR = final_color;
}