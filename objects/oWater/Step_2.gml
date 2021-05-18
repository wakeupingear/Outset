/// @description Set collision position
inRange=!((x+image_xscale<camX()||x>camX()+384)||(y+image_yscale<camY()||y>camY()+216));

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