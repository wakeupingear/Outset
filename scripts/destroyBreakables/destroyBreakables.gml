// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function destroyBreakables(){
	while place_meeting(x,y,breakable)
	{
		var _b=instance_place(x,y,breakable)
		_b.x=-100;
		instance_destroy(_b);
	}
}