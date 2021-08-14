/// @description Survive
scr_wastes_2();
instance_destroy(oNotFloor);
oRoomswitch.target_y=600;
oParachute.myHealth=3;
alarm[1]=-1;
persistent=true; //I could do an event obj but this doesn't need to save since it's a 1-time obj removal
oParachute.persistent=true;
alarm[3]=60;