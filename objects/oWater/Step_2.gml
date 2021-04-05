/// @description Set collision position
coll.x=x;
coll.y=y;
coll.image_xscale=image_xscale;

if global.alive
{
	time=(time+0.005) mod 1;

	with coll
	{
		if touch
		{
			if !place_meeting(x,y,ply) 
			{
				touch=false;
				with parent 
				{
					if place_meeting(x,y,ply) global.inWater=true;
					else global.inWater=false;
				}
			}
		}
		else if place_meeting(x,y,ply)
		{
			touch=true;
		}
	}
}