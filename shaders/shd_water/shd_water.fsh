//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform float u_yoff;

void main()
{
    vec2 Coord = v_vTexcoord + vec2(cos((v_vTexcoord.y-u_yoff)*20.0+u_time*6.2831)/100.0,0);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, Coord);
}
