/// @description Clicked
if buttonPressed(control.confirm)&&ds_list_size(cardList)>0&&place_meeting(x,y,oMouse)
{
	if ds_queue_size(cardQueue)==0 //regroup
	{
		for (var i=0;i<ds_list_size(cardList);i++)
		{
			var _c=cardList[|i];
			ds_queue_enqueue(cardQueue,_c);
			_c.target_x=x;
			_c.alarm[1]=1;
			_c.moving=true;
			_c.child=-1;
			_c.parent=-1;
			topCard=-1;
		}
	}
	else if place_meeting(x,y,oCard)
	{
		var _lastObj=-1;
		var _rep=min(1,ds_queue_size(cardQueue));
		for (var i=0;i<_rep;i++)
		{
			var _c=ds_queue_dequeue(cardQueue);
			_c.child=-1;
			_c.target_x=x+36+i*12;
			_c.alarm[2]=1;
			_c.moving=true;
			if _lastObj==-1
			{
				if topCard!=-1 
				{
					topCard.child=_c;
					_c.parent=topCard;
				}
			}
			else 
			{
				_lastObj.child=_c;
				_c.parent=_lastObj;
			}
			_lastObj=_c;
		}
		topCard=_lastObj;
	}
}