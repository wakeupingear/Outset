riding=0;
spd=5;
wallclimb=false; //animation
touch=false;

state=moveState.standing;
setCollision();

eject=function(die){
	persistent=false;
	if buttonPressed(control.jump) ply.state=moveState.jumping;
	else ply.state=moveState.falling;
	ply.visible=true;
	ply.vsp=round((y-yprevious)*1.5);
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