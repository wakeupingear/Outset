//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_color;

void main()
{
    if (texture2D( gm_BaseTexture, v_vTexcoord ).a>0.0) gl_FragColor = v_vColour*vec4(u_color,texture2D( gm_BaseTexture, v_vTexcoord ).a);
	else gl_FragColor=texture2D( gm_BaseTexture, v_vTexcoord );
}

