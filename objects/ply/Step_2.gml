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
	var _pNum=4;
	if global.roomTime%_pNum==0
	{
		var _blend=c_white;
		//if global.roomTime%(_pNum*2)==0 _blend=c_orange;
		particle(x,y,depth+1,sprite_index,image_index,{xscale: xscale, yscale: yscale,alpha:0.75,fade:0.07, blend: _blend});
	}
}