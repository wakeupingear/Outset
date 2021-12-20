varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_alpha;
uniform vec2 u_pixel;
uniform vec3 u_color;

void main()
{
 float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
 
 if (alpha==0.0)
 {
	 gl_FragColor=vec4(0.0);
	 
	 vec2 offsetX=vec2(0.0,0.0);
	 offsetX.x=u_pixel.x;
	 vec2 offsetY=vec2(0.0,0.0);
	 offsetY.y=u_pixel.y;
  
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord + offsetX).a);
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord - offsetX).a);
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord + offsetY).a);
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord - offsetY).a);
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord + offsetX + offsetY).a);
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord - offsetX + offsetY).a);
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord + offsetX - offsetY).a);
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord - offsetX - offsetY).a);
  
	 if (alpha>0.0) {
	  if (u_alpha==1.0) gl_FragColor.rgb=u_color;
	  else gl_FragColor.rgb*=(1.0-u_alpha);
	  gl_FragColor.a=1.0;
	 }
 }
 else gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}