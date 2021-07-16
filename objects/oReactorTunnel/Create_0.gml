image_speed=0;

door=instance_create_depth(x,y,depth-1,oDoor);
door.sprite_index=sprite_index;

path_start(pCircle,2,path_action_restart,false);