varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float top;
uniform float bot;
uniform float left;
uniform float right;

void main()
{
	float _x=v_vTexcoord.x;
	float _y=v_vTexcoord.y;
    if (_y>(top/216.0)&&_y<(bot/216.0))
	{
		if (_x>(left/384.0)&&_x<(right/384.0))
		{
			gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
		}
	}
}
