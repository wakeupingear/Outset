/// @description Move

if global.alive
{
	lerpProgX=((lerpProgX+0.4/xLerp*xSpd)%width);
	lerpProgY=((lerpProgY+0.4/yLerp*ySpd)%height);
}