/// @description Print camera
var _list=ds_list_create();
instance_place_list(x,y,oCameraFramePoint,_list,false);
if ds_list_size(_list)==2
{
	if _list[|0].x<_list[|1].x
	{
		var _left=_list[|0];
		var _right=_list[|1];
	}
	else 
	{
		var _left=_list[|1];
		var _right=_list[|0];
	}
	
	var _str="addRoomCamera(\""+room_get_name(room)+"\","+string(_left.x)+","+string(_left.y)+","+string(_right.x)+","+string(_right.y)+","+string(x)+","+string(y)+");";
	show_debug_message(_str);
}

for (var i=0;i<ds_list_size(_list);i++) instance_destroy(_list[|i]);
ds_list_destroy(_list);
instance_destroy();