//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;

void main()
{
	float am=cos(v_vTexcoord.y*20.0+v_vTexcoord.x*10.0+u_time*6.2831)/100.0;
	float am2=sin(v_vTexcoord.y*20.0+v_vTexcoord.x*10.0+u_time*6.2831)/100.0;
	vec2 coord = v_vTexcoord + vec2(am,am*4.0);
	vec4 baseCol=texture2D( gm_BaseTexture, coord);
	if (baseCol.r>0.0&&baseCol.r<1.0) gl_FragColor=v_vColour*vec4(baseCol.r); //edge
	else gl_FragColor=v_vColour*vec4(baseCol.r,baseCol.g,baseCol.b,baseCol.r); //outside/inside
	//else if (baseCol.a>0.0) gl_FragColor=vec4(0.0,0.0,0.0,0.35);
}