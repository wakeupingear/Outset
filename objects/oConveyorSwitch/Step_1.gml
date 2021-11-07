/// @description Touch enemy
event_inherited();
if global.alive&&roomHasPower("factory")
{
	if !enemTouch
	{
		if place_meeting(x,y,enem)
		{
			switchConveyors();
			enemTouch=true;
		}
	}
	else enemTouch=place_meeting(x,y,enem);
}