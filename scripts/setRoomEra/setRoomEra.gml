function setRoomEra(){
	if variable_struct_exists(global.rooms,room_get_name(room)){
	var _eras=ds_list_create();
	var _r=global.rooms[$ room_get_name(room)].region;
	var _pos=-1;
	switch (_r)
	{
		case worldRegion.notdon:
			ds_list_add(_eras,"mykoEra","pro1","pro2","pro3",
			"present","future"); //all era layer phrases
			_pos=global.notdonEra;
			break;
		default:
			switch (room)
			{
				default: break;
			}
			break;
	}
	
	if _pos>-1
	{
		var _layers=layer_get_all(); //set current era layer to active
		for (var i=0;i<array_length(_layers);i++)
		{
			if string_pos(_eras[|_pos],string_lower(layer_get_name(_layers[i])))>0||layer_get_name(_layers[i])=="mykoSpawn"
			{
				instance_activate_layer(_layers[i]);
				layer_set_visible(_layers[i],true);
				array_delete(_layers,i,1);
				i--;
			}
		}
		ds_list_delete(_eras,_pos); //remove current era from list
			
		for (var i=0;i<array_length(_layers);i++) //deactivate other era layers
		{
			for (var k=0;k<ds_list_size(_eras);k++)
			{
				if string_pos(_eras[|k],string_lower(layer_get_name(_layers[i])))>0
				{
					instance_deactivate_layer(_layers[i]);
					layer_set_visible(_layers[i],false);
				}
			}
		}
	}
	ds_list_destroy(_eras);
	}
	
	switch room
	{
		case rAir:
			if instance_exists(oAirFloat) instance_destroy(oAirFloat);
			instance_create_depth(0,0,depth,oAirFloat);
		default: break;
	}
}