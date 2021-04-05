/// @description Retreat over mountain
moving=true;
image_xscale-=0.01;
image_yscale=image_xscale;
if y==yTo 
{
	if image_xscale>0.8 yTo=camY()-100;
	else if image_xscale<0.5 yTo=camY()+348;
}

if image_xscale>0 alarm[5]=1;
else instance_destroy();