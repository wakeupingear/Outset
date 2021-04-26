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
else 
{
	x-=10000;
	if touch 
	{
		with ply if !place_meeting(x,y,oWater) 
		{
			global.inWater=false;
		}
	}
	touch=false;
	x+=10000;
}