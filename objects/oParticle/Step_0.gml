if alwaysMove||global.alive
{
	x+=lengthdir_x(spd,direction);
	y+=lengthdir_y(spd,direction);
	if falling
	{
		if direction mod 270 !=0 direction-=sign(direction-270);
	}
	image_alpha-=fade;
	image_angle+=angSpd;
	if x<-50||x>room_width+50||y<-50||y>room_height+50||image_alpha<0
	{
		if !startOffscreen instance_destroy();
	}
	else startOffscreen=false;
	if isHit&&(x!=xprevious||y!=yprevious)
	{
		if instance_exists(oTerrain) oTerrain.render=false;
	}
}