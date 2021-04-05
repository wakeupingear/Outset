//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float redCol;
uniform float greenCol;
uniform float blueCol;

void main()
{
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
	col.a=1.0;
    if (abs(col.r-redCol)<0.01 && abs(col.g-greenCol)<0.01&& abs(col.b-blueCol)<0.01) {
       col.a=0.0;// v_vColour; 
	   //threshold in the check lets this work on mobile html
    }
    gl_FragColor = col;
}