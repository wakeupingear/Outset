/// @description Animation
//special overrides
if state==moveState.standing&&!global.menuOpen
{
	if buttonHold(control.up)&&buttonHold(control.down)
	{
		if animation.currentAnimation!="disappointment"
		{
			image_index=setAnimation("disappointment",animation);
		}
	}
	else if buttonHold(control.up)
	{
		if animation.currentAnimation!="lookingUp"
		{
			image_index=setAnimation("lookingUp",animation);
		}
	}
	else if buttonHold(control.down)
	{
		if animation.currentAnimation!="lookingDown"
		{
			image_index=setAnimation("lookingDown",animation);
		}
	}
	else
	{
		if animation.currentAnimation!="standing"
		{
			image_index=setAnimation("standing",animation);
		}
	}
}
else if state==moveState.standing
{
	if animation.currentAnimation!="standingStill" image_index=setAnimation("standingStill",animation);
}

if !instance_exists(oPlayerMove) npcAnimation();

if goingFast
{
	ghostTrail(x,y,4,depth+1,sprite_index,image_index,{xscale:xscale,yscale:yscale,alwaysMove: true,fade: 0.07-(!global.alive)*0});
}