varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float top;
uniform float bot;
uniform float left;
uniform float right;

void main()
{
	gl_FragColor=vec4(0.0); //unix needs this for stopping garbage texture data from appearing around the cutout
	float _x=v_vTexcoord.x;
	float _y=v_vTexcoord.y;
    if (_y>top&&_y<bot)
	{
		if (_x>left&&_x<right)
		{
			gl_FragColor = v_vColour*texture2D( gm_BaseTexture, v_vTexcoord );
		}
	}
}
