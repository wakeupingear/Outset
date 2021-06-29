/// @description Animation
//special overrides
if state==moveState.standing&&!global.menuOpen
{
	if buttonHold(control.up)
	{
		if animation.currentAnimation!="lookingUp"
		{
			animation.currentAnimation="lookingUp";
			animation.animating=true;
		}
	}
	else if buttonHold(control.down)
	{
		if animation.currentAnimation!="lookingDown"
		{
			animation.currentAnimation="lookingDown";
			animation.animating=true;
		}
	}
	else
	{
		if animation.currentAnimation!="standing"
		{
			animation.currentAnimation="standing";
			animation.animating=true;
		}
	}
}

npcAnimation();