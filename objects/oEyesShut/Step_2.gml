/// @description Animate
if mode!=0
{
	animateProperty(id,"yscale",curves[abs(mode)-1],image_yscale,(mode<0?0:108),spd,false);
	mode=0;
}