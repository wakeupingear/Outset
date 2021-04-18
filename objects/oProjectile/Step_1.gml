/// @description Move
if alwaysMove||global.alive
{
	x+=lengthdir_x(spd,direction);
	y+=lengthdir_y(spd,direction)+vsp;
	if falling vsp+=global.grav*gravMultiplier;
	
	if offscreen(x,y)
	{
		if !startOffscreen instance_destroy();
	}
	else startOffscreen=false;
	
	image_alpha-=fade;
	image_angle=(image_angle+angSpd) mod 360;
	if point image_angle=point_direction(xprevious,yprevious,x,y);
	
	if collidable&&groundCollision(x,y) instance_destroy();
}