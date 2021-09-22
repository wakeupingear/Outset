

function destroyBreakables(){
	var _hit=false;
	for (var i=0;i<argument_count;i++)
	{
		while place_meeting(x,y,argument[i])
		{
			_hit=true;
			var _b=instance_place(x,y,argument[i]);
			switch _b
			{
				case oWastesCrate:
					with _b damageCrate();
					break;
				default:
					_b.x=-100;
					instance_destroy(_b);
					break;
			}
		}
	}
	if _hit shake(1,1,10);
	return _hit;
}