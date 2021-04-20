/// @description Position
image_speed=(global.alive);
if instance_exists(oVShip)
{
	x=oVShip.x;
	y=oVShip.y;
	image_xscale=oVShip.image_xscale;
	image_yscale=oVShip.image_yscale;
	depth=oVShip.depth;
	oVShip.alarm[4]=-1;
}
else instance_destroy();