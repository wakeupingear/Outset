//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 baseCol=texture2D( gm_BaseTexture, v_vTexcoord );
	if (baseCol.r==1.0) gl_FragColor=vec4(1.0);
	else if (baseCol.a>0.0) gl_FragColor=vec4(0.0,0.0,0.0,0.75);
}
