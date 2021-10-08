varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_bright;
uniform vec3 u_color;

void main()
{
    vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(
		mix(base_col.r,u_color.r,u_bright),
		mix(base_col.g,u_color.g,u_bright),
		mix(base_col.b,u_color.b,u_bright),
	base_col.a);
}