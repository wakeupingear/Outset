/// @description 
if !global.menuOpen
{
	if !sitting
	{
		if distance_to_object(ply)<=abs(sprite_width)&&(image_index==0||text!=-1)&&place_meeting(x,y,ply)
		{
			global.interactText=check;
			if ply.state<=moveState.running&&(buttonPressed(control.confirm)||buttonPressed(control.up))
			{
				if text!=-1
				{
					conversation(text);
				}
				else
				{
					ply.state=moveState.floating;
					ply.visible=false;
					ply.xscale=image_xscale;
					image_index=1;
					sitting=true;
					oCamera.followObj=id;
				}
			}
		}
	}
	else
	{
		ply.x=x;
		ply.y=y;
		var _exit=false;
		if buttonPressed(control.jump)
		{
			_exit=true;
			ply.state=moveState.jumping;
		}
		else if buttonPressed(control.confirm)
		{
			_exit=true;
			ply.state=moveState.standing;
		}
		else if oGrapple.state>1
		{
			_exit=true;
			ply.state=moveState.pulling;
		}
	
		if _exit
		{
			oCamera.followObj=oPlayerCam;
			ply.visible=true;
			sitting=false;
			image_index=0;
			with ply while groundCollision(x,y) y--;
		}
	}
}