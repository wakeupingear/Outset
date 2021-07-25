parentObj=-1;
type=0; //0=shot by enemy, 1=shot by player, 2=cosmetic

point=true; //points towards distance
vsp=0;
gravMultiplier=1;
spd=2;
falling=false;

angSpd=0;
fade=0;

startOffscreen=true;
alwaysMove=false;

hurtsPlayer=false;
collideParent=false;

collidable=true;
collType=hitobj;
state=moveState.standing;
collPointX=[0];
collPointY=[1];

destroyInd=-1;
destroyOnCleanup=false;
data=-1;