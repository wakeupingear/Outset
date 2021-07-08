/// @description Animate
if global.alive&&on
{
	frameTime++;
	if frameTime>8/abs(spd)
	{
		frameTime=0;
		image_index=(image_index+sign(spd));
		if image_index<0 image_index=7;
		else if image_index>7 image_index=0;
	}
	direction=(direction+spd/3)%360;
}