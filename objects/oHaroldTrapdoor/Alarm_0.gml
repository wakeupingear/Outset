/// @description Open
image_angle-=90/time;
if image_angle<=-90
{
	image_angle=-90;
	shake(1,1,10);
	alarm[2]=30;
}
else alarm[0]=1;