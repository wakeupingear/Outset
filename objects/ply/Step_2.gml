/// @description Animation
//special overrides
if state==moveState.standing
{
	if buttonHold(control.up)
	{
		if currentAnimation!="lookingUp"
		{
			currentAnimation="lookingUp";
			animating=true;
		}
	}
	else if buttonHold(control.down)
	{
		if currentAnimation!="lookingDown"
		{
			currentAnimation="lookingDown";
			animating=true;
		}
	}
	else
	{
		if currentAnimation!="standing"
		{
			currentAnimation="standing";
			animating=true;
		}
	}
}

npcAnimation();