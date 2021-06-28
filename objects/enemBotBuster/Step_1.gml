/// @description Movement
if move==0 move=xscale;
if groundCollision(x+move,y-maxYChange)
{
	move*=-1;
}

event_inherited();

if global.alive&&instance_exists(ply)
{
	if ply.y<y
	{
		if flipIndex!=topFrame&&!flipAnimation.animating 
		{
			setAnimation("flipUp",flipAnimation);
		}
	}
	else
	{
		if flipIndex!=sideFrame&&!flipAnimation.animating 
		{
			setAnimation("flipDown",flipAnimation);
		}
	}
}