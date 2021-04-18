/// @description Scale
image_xscale-=0.01
image_angle-=90/200;
if image_xscale>-1 alarm[1]=1;
else
{
	shake(2,2,20);
	alarm[2]=60;
}