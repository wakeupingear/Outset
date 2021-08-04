/// @description Move
if origXOff==-1
{
	origXOff=xOff-width;
	origYOff=yOff-height;
}

if global.alive
{
	if image_angle==0
	{
		lerpProgX=((lerpProgX+0.4/xLerp)%width);
		xOff=origXOff+lerpProgX;
	}
}