/// @description Check trigger
if global.alive{
if !cracking 
{
	switch triggerType
	{
		case 0:
			if instance_exists(ply)&&abs(ply.x-x)<(sprite_width-18)/2&&place_meeting(x,y-1,ply) cracking=true;
			break;
	}
}
else
{
	crackTime++;
	if crackTime>7
	{
		image_alpha=1;
		crackTime=0;
		crackInd++;
		if crackInd>=destFrames[0] instance_destroy();
	}
}
}