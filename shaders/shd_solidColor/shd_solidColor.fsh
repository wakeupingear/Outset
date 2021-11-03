//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_color;

void main()
{
    gl_FragColor = vec4(u_color,texture2D( gm_BaseTexture, v_vTexcoord ).a);
}

