var _ind=image_index;
event_inherited();
frontInd=_ind;

alarm[1]=1;

hit=instance_create_depth(x,y,depth,hitobj);
hit.sprite_index=sprite_index;
hit.image_index=3; //stops npcs from getting ejected out of the warehouse on creation

behindWall=instance_create_depth(x,y,depth+1,oPlaceholder);
behindWall.sprite_index=sprite_index;
behindWall.image_index=image_number-1;

catwalkFloor=-1;

touch=true;

//controller.removeCamera(room_get_name(room),x,y);
//controller.addRoomCamera(room_get_name(room),x-170,y-25,x+170,y+104,x,y);