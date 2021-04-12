/// @description Set collision position
inRange=!((x+image_xscale<camX()||x>camX()+384)||(y+image_yscale<camY()||y>camY()+216));

if inRange&&touchingPly()
{
	touch=true;
	global.inWater=true;
}
else 
{
	if touch global.inWater=false;
	touch=false;
}