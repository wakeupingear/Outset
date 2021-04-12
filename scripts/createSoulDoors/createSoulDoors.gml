function createSoulDoors(){
	if ds_map_exists(global.soulDoors,room_get_name(room))
	{
		var _arr=global.soulDoors[? room_get_name(room)];
		for (var i=0;i<array_length(_arr);i+=5)
		{
			var _d=instance_create_depth(_arr[i],_arr[i+1],layer_get_depth("people")+1,oSoulDoor);
			_d.targetroom=_arr[i+2];
			_d.target_x=_arr[i+3];
			_d.target_y=_arr[i+4];
			with _d if !place_meeting(target_x,target_y,oSave) instance_destroy();
		}
	}
}