shader_type spatial;

uniform vec4 albedo_texture : source_color;
uniform sampler2D blood_normal_noise;
uniform vec4 blood_color : source_color;
uniform float time_scale : hint_range(0.0, 1.00, 0.25) = 1.0;
uniform float blood_level : hint_range(0.0, 1.0, 0.1) = 1.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 _uv = UV;
	vec4 albedo_color = albedo_texture;
	
	if (_uv.y > blood_level){
		ALBEDO = blood_color.rgb;
		ALPHA = blood_color.a;
	} else {
		ALBEDO = albedo_color.rgb;
		ALPHA = albedo_color.a;
	}
	
	_uv.x += sin(TIME * time_scale + (_uv.x + _uv.y )* 25.0) * 0.01;
	_uv.y += cos(TIME * time_scale + (_uv.x + _uv.y )* 25.0) * 0.01;
	
	ALBEDO = blood_color.rgb;
	NORMAL_MAP = texture(blood_normal_noise, _uv).rgb;
	ROUGHNESS = .2;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
