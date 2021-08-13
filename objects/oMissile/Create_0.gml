event_inherited();

alarm[1]=-1; //stop soul
canDropSoul=false;
soulNum=0;

startOffscreen=false;

xDir=0;
yDir=0;

hsp=0;
vsp=-5;
myHealth=99;
state=moveState.falling;

damage=1;
spd=2;

scope=false;
scopeAlpha=0;
scopeBlend=[c_white,c_soulBlue];

collPointX=[24];
collPointY=[0];
hitTerrain=1;

alarm[0]=1;