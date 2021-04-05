/// @description Scale up
image_xscale+=0.01;
image_yscale+=0.01;
if image_xscale>0.4
{
	image_alpha-=0.05;
	if image_alpha>0 alarm[0]=1; 
}
else alarm[0]=1;