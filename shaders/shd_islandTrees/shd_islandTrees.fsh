//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_pixel;

void main()
{
	vec2 offsetX;
	offsetX.x = u_pixel.x;
	vec2 offsetY;
	offsetY.y = u_pixel.y;
	 
	float newCol=0.7;
	float alpha=0.0;
	vec4 darken=vec4(1.0);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetX).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetX).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetY).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetY).a);
	if (alpha<3.0) darken=vec4(newCol,newCol,newCol,1.0);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )*darken;
}
