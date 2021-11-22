/// @description Pressed
event_inherited();

if active&&image_index==0
{
	if place_meeting(x,y,oPhysicsObj)
	{
		var _o=instance_place(x,y,oPhysicsObj);
		_o.vsp=bounceVsp;
		_o.jump=0;
		image_index=1;
		alarm[0]=resetTime;
		if isPlayer(_o)
		{
			shake(1,1,10);
			_o.goingFast=true;
			_o.justLaunched=true;
			_o.state=moveState.jumping;
		}
	}
}