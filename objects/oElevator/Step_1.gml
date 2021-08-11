/// @description Move
if global.alive
{
	if mode==0
	{
		if instance_exists(ply)&&ply.state!=moveState.floating&&place_meeting(x,y,ply)
		{
			if animation.currentAnimation!="opening" setAnimation("opening",animation);
			global.interactText=check;
			if up!=""&&(buttonPressed(control.up)||buttonPressed(control.confirm))
			{
				if up!="1" conversation(up);
				else enter(-1);
			}
			else if down!=""&&(buttonPressed(control.down)||buttonPressed(control.confirm))
			{
				if down!="1" conversation(down);
				else enter(1);
			}
		}
		else
		{
			if animation.currentAnimation!="closing" setAnimation("closing",animation);
		}
	}
	else if abs(mode)==1&&ply.image_alpha==0
	{
		ply.y+=spd*mode;
		ply.x=x;
		x-=300;
		var _id=id;
		with ply if place_meeting(x,y,oElevator)
		{
			var _e=instance_place(x,y,oElevator);
			if abs(y-_e.y)<=_e.spd
			{
				with _e eject();
				with _id mode=0;
			}
		}
		x+=300;
	}
}