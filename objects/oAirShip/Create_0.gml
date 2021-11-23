image_speed=0;

npcMovementVars();
collType=airHitobj;
hspAcc=0.3;
hspMax=3.2;
vspMax=4;

boarded=false;
eject=function(die){
	persistent=false;
	if buttonPressed(control.jump) ply.state=moveState.jumping;
	else ply.state=moveState.falling;
	ply.visible=true;
	ply.vsp=round((y-yprevious)*1.5);
	
	move=0;
	boarded=false;
}