/// @description Oscillate
yVars=oscillate(yVars,"y",true,true);
if !staticCoin&&instance_exists(ply)
{
	if distance_to_object(ply)<48
	{
		var _dir=point_direction(x,y,ply.x,ply.y);
		x+=lengthdir_x(1.5,_dir);
		y+=lengthdir_y(1.5,_dir);
	}
}