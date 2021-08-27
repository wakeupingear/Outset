varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_pixel;
uniform vec2 u_dist;
uniform vec2 u_origin;
uniform vec3 u_tunnelColor;

void main()
{
	float dist=sqrt(pow(v_vTexcoord.x-u_origin.x,2.0) + pow(v_vTexcoord.y-u_origin.y,2.0))-sqrt(u_dist.x*u_dist.y);
    vec4 newColor=v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if (dist>0.0) newColor+=vec4(u_tunnelColor.r,u_tunnelColor.g,u_tunnelColor.b,1.0)*dist;
	gl_FragColor = newColor;
}
