/// @description Spawn missile
var _x=irandom_range(20,180);
createMissile(_x+192*side,236+irandom(24));
oNotFloor.y++;
side=!side;
alarm[1]=20+round(alarm[2]/4);