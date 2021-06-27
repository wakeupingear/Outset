/// @description Create collision
if !active y=-10;
if isHit>0
{
	if isHit==1 
	{
		hit=instance_create_depth(x,y,depth,hitobj);
		hit.image_alpha=0
		hit.visible=false;
		ds_list_add(oTerrain.terrain,hit);
	}
	else 
	{
		hit=instance_create_depth(x,y,depth,grappleHit);
		hit.visible=true;
	}
	hit.sprite_index=sprite_index;
	hit.image_index=image_index;
	hit.image_xscale=image_xscale;
	hit.image_yscale=image_yscale;
	hit.image_angle=image_angle;
	renderTerrain();
}

parts=array_create(destFrames[1]-destFrames[0],-1);