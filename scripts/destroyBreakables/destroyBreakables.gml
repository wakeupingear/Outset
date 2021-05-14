

function destroyBreakables(){
	while place_meeting(x,y,breakable)
	{
		var _b=instance_place(x,y,breakable)
		_b.x=-100;
		instance_destroy(_b);
	}
}