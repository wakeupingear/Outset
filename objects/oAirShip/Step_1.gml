/// @description Move
if global.alive
{
	if !boarded
	{
		if !global.transitioning&&!global.menuOpen&&place_meeting(x,y,ply)&&ply.state<=moveState.running
		{
			setInteractText(10);
			if buttonPressed(control.up)||buttonPressed(control.confirm)
			{
				boarded=true;
				ply.state=moveState.floating;
				ply.visible=false;
			}
		}
	}
	else
	{
		ply.x=x;
		ply.y=y;
		ply.xscale=xscale;
		move=buttonHold(control.right)-buttonHold(control.left);
		if buttonPressed(control.jump)
		{
			vsp=-5;
		}
		if global.plyHealth<=0 eject(true);
		else if oGrapple.state>1 eject(false);
	}
	physics();
	hit.x=x;
	hit.y=y;
}