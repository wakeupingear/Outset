//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform float u_size;

void main()
{
	float val = (v_vTexcoord.y*20.0+u_time*6.2831);
    vec2 Coord = v_vTexcoord + vec2(cos(val)/u_size,sin(val)/u_size);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, Coord);
}
