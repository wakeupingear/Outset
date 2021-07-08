/// @description Check falling
if global.alive&&!touch
{
	if isInRange(x,y)&&place_meeting(x,y-1,oPhysicsObj)
	{
		touch=true;
		alarm[0]=1;
	}
}
