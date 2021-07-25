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
	if point&&angSpd==0 image_angle=point_direction(xprevious,yprevious,x,y);
	
	if collidable&&groundCollision(x,y) instance_destroy();
	else if hurtsPlayer&&place_meeting(x,y,ply)
	{
		if ply.image_blend!=c_red hurtPlayer(1,0,0);
		else shake(1,1,10);
		instance_destroy();
	}
	else if place_meeting(x,y,enem)&&(type==1||collideParent||!place_meeting(x,y,parentObj))
	{
		hurtEnem(instance_place(x,y,enem),1);
		instance_destroy();
	}
}