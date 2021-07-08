/// @description 
if origXOff==-1
{
	origXOff=xOff-sprite_width;
	origYOff=yOff-sprite_height;
}

if global.alive
{
	if image_angle==0
	{
		lerpProgX=((lerpProgX+spd)%sprite_width);
		xOff=origXOff+lerpProgX;
	}
}