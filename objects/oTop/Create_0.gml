riding=0;
spd=5;
wallclimb=false; //animation
touch=false;

state=moveState.standing;
setCollision();

eject=function(die){
	persistent=false;
	if buttonPressed(control.jump) ply.state=moveState.falling;
	else ply.state=moveState.falling;
	ply.visible=true;
	ply.vsp=0;
	ply.hsp=0;
	
	if die
	{
		instance_destroy();
	}
	else
	{
		riding=3;
	}
}