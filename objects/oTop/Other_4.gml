/// @description Hide player
if persistent
{
	if instance_exists(ply)
	{
		ply.visible=false;
		ply.xscale=image_xscale;
		x=global.plyX;
		y=global.plyY;
	}
}