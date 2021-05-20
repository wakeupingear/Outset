/// @description Set collision position
inRange=isInRange(x,y);

if inRange&&touchingPly()
{
	if global.alive
	{
		touch=true;
		global.inWater=true;
	}
}
else if touch
{
	x-=10000;
	with ply
	{
		if !place_meeting(x-4,y,oWater)&&!place_meeting(x+4,y,oWater)&&!place_meeting(x,y-4,oWater)&&!place_meeting(x,y+4,oWater)
		{
			global.inWater=false;
			touch=false;
		}
	}
	x+=10000;
}