image_speed=0;

leftBar=instance_create_depth(x,y,depth+1,oGravityField)
leftBar.sprite_index=sprite_index;
leftBar.image_index=1;
rightBar=instance_create_depth(x,y,depth+1,oGravityField)
rightBar.sprite_index=sprite_index;
rightBar.image_index=2;

alarm[1]=2;