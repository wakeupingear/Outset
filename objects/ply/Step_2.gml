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

if !instance_exists(oPlayerMove) npcAnimation();

if goingFast
{
	ghostTrail(x,y,4,depth+1,sprite_index,image_index,{xscale:xscale,yscale:yscale,alwaysMove: true,fade: 0.07-(!global.alive)*0.05});
}