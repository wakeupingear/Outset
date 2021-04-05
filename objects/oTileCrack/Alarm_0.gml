/// @description Create collision
if !active y=-10;
if isHit>0
{
	if isHit==1 hit=instance_create_depth(x,y,depth,oTerrainHitobj);
	else hit=instance_create_depth(x,y,depth,grappleHit);
	hit.sprite_index=sprite_index;
	hit.image_index=image_index;
	hit.image_xscale=image_xscale;
	hit.image_yscale=image_yscale;
	hit.image_angle=image_angle;
	visible=false;
}

parts=array_create(destFrames[1]-destFrames[0],-1);