varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_pixel;
uniform vec3 u_color;

void main()
{
 gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
 float alpha = v_vColour.a;
 if (alpha==1.0)
 {
	  vec2 offsetX;
	 offsetX.x = u_pixel.x;
	 vec2 offsetY;
	 offsetY.y = u_pixel.y;
 
	 alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetX).a);
	 alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetX).a);
	 alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetY).a);
	 alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetY).a);
	 alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetX+offsetX).a);
	 alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetX-offsetX).a);
	 alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetY+offsetY).a);
	 alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetY-offsetY).a);
	 alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetX+offsetX+offsetY+offsetY).a);
	 alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetX+offsetX-offsetY-offsetY).a);
	 alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetX-offsetX+offsetY+offsetY).a);
	 alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetX-offsetX-offsetY-offsetY).a);
  
	 if (alpha<13.0) {
	  gl_FragColor.rgb=u_color;
	 }
 }

}