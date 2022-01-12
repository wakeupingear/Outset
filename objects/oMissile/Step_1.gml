/// @description Move
if global.alive{
x+=(lengthdir_x(spd,direction))+hsp;
y+=(lengthdir_y(spd,direction))+vsp;
image_angle=point_direction(xprevious, yprevious, x, y);
if startOffscreen startOffscreen=offscreen(x,y,0);
else if instance_exists(target)&&!isObj(target,ply)&&place_meeting(x,y,target) instance_destroy();
else if offscreen(x,y,0) instance_destroy();
else
{
	if hitTerrain==1||!instance_exists(ply)
	{
		if groundCollision(x,y) instance_destroy();
	}
	else if hitTerrain==2
	{
		if y>ply.y-24&&groundCollision(x,y) instance_destroy();
	}
}
}