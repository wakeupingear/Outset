/// @description Movement
if global.alive
{
	if x!=xTo||y!=yTo
	{
		x=lerp(x,xTo,0.1);
		y=lerp(y,yTo,0.1);
		if distance_to_point(xTo,yTo)<0.01&&false
		{
			x=xTo;
			y=yTo;
		}
	}
}