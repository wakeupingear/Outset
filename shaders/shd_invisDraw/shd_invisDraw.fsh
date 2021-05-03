//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_color;

void main()
{
	if (texture2D( gm_BaseTexture, v_vTexcoord ).a==0.0) gl_FragColor = u_color;
}
