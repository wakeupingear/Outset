/// @description Mpve
if global.alive
{
	if !attacking
	{
		hover=oscillate(hover,"y",true,true);
		if image_blend=c_red
		{
			with enemDragami attacking=true;
		}
	}
	else
	{
		if instance_exists(ply)
		{
			if ply.y>y gravMultiplier=1;
			else gravMultiplier=-1;
			if ply.x>x move=1;
			else move=-1;
		}
		else
		{
			gravMultiplier=0;
			move=0;
			attacking=false;
		}
	}
}

event_inherited();