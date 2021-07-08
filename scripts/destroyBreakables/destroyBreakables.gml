

function destroyBreakables(){
	while place_meeting(x,y,oBreakable)
	{
		var _b=instance_place(x,y,oBreakable)
		_b.x=-100;
		instance_destroy(_b);
		shake(1,1,10);
	}
}