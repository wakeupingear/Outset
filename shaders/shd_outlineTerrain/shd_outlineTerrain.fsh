varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_alpha;
uniform vec2 u_pixel;
uniform vec3 u_color;
uniform float u_bw;

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
	  if (u_alpha==1.0) gl_FragColor.rgb=u_color;
	  else gl_FragColor.rgb*=(1.0-u_alpha);
	 }
	 
	 if (u_bw>0.0)
	 {
		 //black and white passthrough
		 //vec3 lum=vec3(0.299,0.587,0.114); //"accurate" black and white
		 vec3 lum=vec3(0.5); //more of a stone black and white
		 //setting lum to 1.0 does a white scale
		 //setting lum to 0.0 does full black
		 vec3 mixed=vec3(dot(gl_FragColor.rgb,lum));
		 vec3 final=vec3(mix(gl_FragColor.r,mixed.r,u_bw),mix(gl_FragColor.g,mixed.g,u_bw),mix(gl_FragColor.b,mixed.b,u_bw));
		 gl_FragColor=vec4(final,gl_FragColor.a);
	 }
 }

}