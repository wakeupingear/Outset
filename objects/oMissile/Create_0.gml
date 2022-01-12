event_inherited();
//if global.rooms[$ room_get_name(room)].region==worldRegion.west image_index=2;

alarm[1]=-1; //stop soul
canDropSoul=false;
soulNum=0;

startOffscreen=offscreen(x,y,0);
target=noone;

xDir=0;
yDir=0;

hsp=0;
vsp=0;
myHealth=99;
state=moveState.falling;

damage=1;
spd=2;

scope=false;
scopeAlpha=0;
scopeBlend=[c_white,c_soulBlue,c_white];
trailBlend=[c_red,c_soulBlue,c_red];

collPointX=[24];
collPointY=[0];
hitTerrain=1;

alarm[0]=1;