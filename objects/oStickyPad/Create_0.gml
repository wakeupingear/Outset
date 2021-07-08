event_inherited();

riding=false;
touch=false;
eject=function(die){
	if buttonPressed(control.jump) ply.state=moveState.jumping;
	else ply.state=moveState.falling;
	ply.visible=true;
	ply.hsp=ply.hspMax*(buttonHold(control.right)-buttonHold(control.left))*2;
	//show_message(ply.hsp)
	riding=false;
	touch=true;
}