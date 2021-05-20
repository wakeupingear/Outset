inRange=isInRange(x,y);
if inRange
{
	myReflectObj=[];
	for (var i=0;i<ds_list_size(global.reflectObj);i++) 
	{
		var _i=global.reflectObj[|i];
		if instance_exists(_i)
		{
			if place_meeting(x,y-image_yscale,_i) 
			{
				array_push(myReflectObj,_i);
				_i.yAxis=y;
			}
		}
		else
		{
			ds_list_delete(list,i);
			i--;
		}
	}
}