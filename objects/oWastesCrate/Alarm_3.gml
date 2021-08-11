/// @description Start falling
vsp=global.grav;
state=moveState.falling;
if place_meeting(x,y-1,oWastesCrate) instance_place(x,y-1,oWastesCrate).alarm[3]=40;