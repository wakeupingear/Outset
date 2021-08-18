/// @description 
image_speed=0;
if !hasData("wCar") addData("wCar");

if room==rWastesCrater&&layer_get_name(layer)!="behind" layer=layer_get_id("behind");

npcMovementVars();
collPointX=[];
collPointY=[];
vspMax=0;
hspMax=3.8;
args=[0,0,0];
alarm[0]=1;
startRoom=room;

riding=false;
wheels=[];

eject=function(die){
	if buttonPressed(control.jump) ply.state=moveState.standing;
	else ply.state=moveState.falling;
	ply.visible=true;
	ply.hsp=ply.hspMax*(buttonHold(control.right)-buttonHold(control.left))*2;
	riding=false;
	move=0;
}