varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_pixel;
uniform vec3 u_color;
uniform vec2 u_origin;
uniform vec2 u_dist;
uniform float u_rippleProg;
#define M_PI 3.1415926535897932384626433832795

void main()
{
	float newAlpha=0.15;
	
 gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
 float alpha = v_vColour.a;
 if (alpha==1.0&&sqrt(pow(v_vTexcoord.x-u_origin.x,2.0) + pow(v_vTexcoord.y-u_origin.y,2.0))<sqrt(u_dist.x*u_dist.y))
 {
	 float amp=(u_pixel.x*50.0);
	 float scale=(3.0+2.0*clamp(sin(u_rippleProg)*2.0,-1.0,1.0)*abs(sin(u_rippleProg+mod(v_vTexcoord.x,amp)/amp*2.0*M_PI)));
	  vec2 offsetX=vec2(0.0,0.0);
	 offsetX.x = u_pixel.x;//*scale;
	 vec2 offsetY=vec2(0.0,0.0);
	 offsetY.y = u_pixel.y*scale;
 
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord + offsetX).a);
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord - offsetX).a);
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord + offsetY).a);
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord - offsetY).a);
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord + offsetX + offsetY).a);
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord - offsetX + offsetY).a);
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord + offsetX - offsetY).a);
	 alpha += (texture2D( gm_BaseTexture, v_vTexcoord - offsetX - offsetY).a);
  
	 if (alpha<9.0) {
	  gl_FragColor.rgb=u_color;
	 }
	 else gl_FragColor.rgb=gl_FragColor.rgb*(1.0-newAlpha)+u_color*newAlpha;
 }

}