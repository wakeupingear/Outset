/// @description Short rotation
image_angle+=0.5;
if image_angle<45 alarm[0]=1;
else
{
	if oWrenchGear.active 
	{
		alarm[3]=1;
		shake(2,2,20);
	}
	else alarm[1]=60;
}