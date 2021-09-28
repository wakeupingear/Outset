/// @description Move
if global.alive
{
	if x!=xTo||y!=yTo
	{
		x=lerp(x,xTo,0.08);
		y=lerp(y,yTo,0.08);
		if distance_to_point(xTo,yTo)<0.1
		{
			x=xTo;
			y=yTo;
		}
	}
}