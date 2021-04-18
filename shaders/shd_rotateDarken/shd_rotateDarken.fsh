//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_xs;
uniform float u_amp;

void main()
{
	vec4 darken=vec4(v_vColour.rgb-vec3(u_xs*u_amp*v_vTexcoord.x),v_vColour.a);
    gl_FragColor = darken * texture2D( gm_BaseTexture, v_vTexcoord );
}
