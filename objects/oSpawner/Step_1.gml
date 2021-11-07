/// @description Count down
if global.alive||alwaysUpdate
{
	count=max(count-1,0);
	if count<=0&&(conditionFunc==-1||conditionFunc())//trigger
	{
		var _obj=-1;
		if mode==spawnMode.ordered
		{
			_obj=objs[pos];
			pos=(pos+1)%array_length(objs);
		}
		else if mode==spawnMode.randomObj
		{
			_obj=objs[irandom(array_length(objs))-1];
		}
		instance_create_layer(x+irandom_range(xRange[0],xRange[1]),y+irandom_range(yRange[0],yRange[1]),layer,_obj);
		count=rate;
	}
}