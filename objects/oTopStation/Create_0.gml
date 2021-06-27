event_inherited();

hit=instance_create_depth(x,y,depth,grappleHit);
hit.sprite_index=sprite_index;
hit.image_index=1;
hit.image_xscale=image_xscale;
hit.image_yscale=image_yscale;
hit.image_angle=image_angle;

holdingTop=false;