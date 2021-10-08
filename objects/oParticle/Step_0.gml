if alwaysMove||global.alive
{
	x+=lengthdir_x(spd,direction)+hsp;
	y+=lengthdir_y(spd,direction)+vsp;
	image_xscale+=xscaleSpd;
	image_xscale=clamp(image_xscale,xscaleMin,xscaleMax);
	image_yscale+=yscaleSpd;
	image_yscale=clamp(image_yscale,yscaleMin,yscaleMax);
	vsp+=grav;
	image_alpha-=fade;
	if point image_angle=point_direction(xprevious,yprevious,x,y);
	else image_angle+=angSpd;
	if image_alpha<0 instance_destroy();
	else if offscreen(x,y)
	{
		if !startOffscreen instance_destroy();
	}
	else startOffscreen=false;
	if isHit&&(x!=xprevious||y!=yprevious)
	{
		if instance_exists(oTerrain) oTerrain.render=false;
	}
	if instance_exists(followObj)
	{
		x=followObj.x;
		y=followObj.y;
	}
	
	if ghost ghostTrail(x,y,ghostFrameOffset,ghostDepth,sprite_index,image_index,{angle:image_angle,xscale:image_xscale,yscale:image_yscale,alwaysMove:ghostAlwaysMove});
}