/// @description Fold down
image_angle-=image_xscale*3;
if image_angle==90||image_angle==270
{
	shake(2,2,15);
}
else alarm[0]=1;