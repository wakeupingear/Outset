/// @description  Movement
if global.alive
{
	if moving&&!alarmsActive(3,4)
	{
		if hsp==0
		{
			shake(1,1,10);
			moving=false;
			alarm[3]=1;
		}
	}
	image_angle+=hsp;
}