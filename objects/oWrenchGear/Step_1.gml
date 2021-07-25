/// @description Hit wrench
if active
{
	if place_meeting(x,y,oProjectile)
	{
		var _p=instance_place(x,y,oProjectile);
		if _p.type==1
		{
			if instance_exists(oWrenchCountdown)&&oWrenchCountdown.alarm[0]>-1 oWrenchCountdown.alarm[0]=1;
			active=false;
			image_speed=0;
			instance_destroy(_p);
		}
	}
}