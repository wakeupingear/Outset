//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform float u_size;

void main()
{
	float val = (v_vTexcoord.y*2.0+v_vTexcoord.x*2.0+u_time*6.2831)*20.0;
	if (cos(val)>0.9&&texture2D( gm_BaseTexture, v_vTexcoord ).a==1.0) gl_FragColor=vec4(1.0);
	else gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
