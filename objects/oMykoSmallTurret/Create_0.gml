/// @description Variables
image_speed=0;

button=noone;
hit=instance_create_depth(x,y,depth,hitobj);
hit.image_xscale=image_xscale;
hit.image_yscale=image_yscale;
hit.image_angle=image_angle;
hit.sprite_index=sprite_index;
hit.image_index=1;
scanVars();