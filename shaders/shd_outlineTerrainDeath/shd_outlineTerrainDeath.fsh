varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_pixel;
uniform vec3 u_color;
uniform vec2 u_origin;
uniform vec2 u_dist;

void main()
{
	float newAlpha=0.15;
	
 gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
 float alpha = v_vColour.a;
 if (alpha==1.0&&sqrt(pow(v_vTexcoord.x-u_origin.x,2.0) + pow(v_vTexcoord.y-u_origin.y,2.0))<sqrt(u_dist.x*u_dist.y))
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
	 else gl_FragColor.rgb=gl_FragColor.rgb*(1.0-newAlpha)+u_color*newAlpha;
 }

}