/// @description Move
if global.alive{
x+=round(lengthdir_x(spd,image_angle))+hsp;
y+=round(lengthdir_y(spd,image_angle))+vsp;
if startOffscreen startOffscreen=offscreen(x,y,0);
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