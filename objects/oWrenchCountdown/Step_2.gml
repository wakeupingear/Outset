/// @description Animate
if (image_angle mod 360)!=0
{
	image_angle+=3;
	image_xscale+=1/60;
	image_yscale=image_xscale;
}