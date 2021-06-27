varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_bright;

void main()
{
    vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(base_col.rgb + u_bright, base_col.a);
}