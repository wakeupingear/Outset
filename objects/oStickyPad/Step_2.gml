/// @description Touching player
if global.alive
{
	if !touch
	{
		if !riding
		{
			if place_meeting(x,y,ply)
			{
				ply.visible=false;
				ply.state=moveState.floating;
				resetGrapple();
				riding=true;
			}
		}
		else
		{
			ply.x=x;
			ply.y=y;
			if global.plyHealth<=0 eject(true);
			else if oGrapple.state>1||buttonPressed(control.jump)||(buttonPressed(control.down)&&(image_angle!=0)) eject(false);
		}
	}
	else touch=place_meeting(x,y,ply);
}