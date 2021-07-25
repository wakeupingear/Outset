/// @description Start soul flashing
if canDropSoul
{
	var _num=hasData(uid);
	if _num==0
	{
		_num=soulNum+1;
		addDataPair(uid,_num); //start at +1 so that no soul = 1 (0=false)
	}
	else soulNum=hasData(uid)-1;
	if _num>1
	{
		alarm[2]=round(x mod flashTime);
	}
}