/// @description Countdown
if image_index==1
{
	oNotdonCrane.alarm[0]=1;
}
else
{
	image_index--;
	if image_index==1
	{
		oWrenchGear.active=true;
		oWrenchGear.image_speed=1;
	}
	alarm[0]=60+40*(image_index==1);
}