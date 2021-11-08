/// @description Switch depth
behind=instance_create_depth(x,y,depth,oPlaceholder);
behind.sprite_index=sprite_index
behind.image_index=image_index
behind.image_xscale=image_xscale;
behind.image_yscale=image_yscale;
behind.image_angle=image_angle;
behind.image_speed=0;

sprite_index=frontSpr;
image_index=frontInd;
depth=layer_get_depth(layer_get_name("player"));
image_alpha=place_meeting(x,y,ply);