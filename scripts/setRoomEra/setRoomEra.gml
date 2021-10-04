function setRoomEra(){
	if variable_struct_exists(global.rooms,room_get_name(room)){
	var _eras=ds_list_create();
	var _r=global.rooms[$ room_get_name(room)].region;
	var _pos=global.notdonEra
	ds_list_add(_eras,"mykoEra","pro1","pro2","pro3","present","future"); //all era layer phrases
	var _layers=layer_get_all();
	//default layers apply to most areas that don't have separate era variables
	switch (_r)
	{
		default:
			switch (room)
			{
				default: break;
			}
			break;
	}
	
	if _pos>-1
	{
		//set current era layer to active
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
	
	switch _r
	{
		case worldRegion.west:
			if instance_exists(oWastesBuilding) instance_destroy(oWastesBuilding);
			scrCreateWastesBuildings();
			break;
		default: break;
	}
	switch room
	{
		case rVRPreBoss:
			if hasData("oVRBoss")
			{
				shake(1,1,20000);
				oVRUnfinishedFire.xSpd=1.5;
			}
			break;
		case rVRUnfinished:
			if hasData("vrChase") 
			{
				instance_create_layer(0,0,"people",oVRChaseBoss);
				scrToggleVRCracks();
			}
			break;
		case rWastesHilltop:
			if hasData("wBRack") with oWastesCrate 
			{
				destroyObjs();
				instance_destroy(id,false);
			}
			else with oWastesCrate state=moveState.floating;
			break;
		case rAir:
			if instance_exists(oAirFloat) instance_destroy(oAirFloat);
			instance_create_depth(0,0,layer_get_depth(layer_get_name("bg")),oAirFloat);
		default: break;
	}
	
	_layers=layer_get_all();
	//find animating tilesets
	for (var i=0;i<array_length(_layers);i++)
	{
		if !layer_get_visible(_layers[i])||string_pos("Tile",layer_get_name(_layers[i]))==0 continue;
		var _tileID=layer_tilemap_get_id(_layers[i]);
		var _tileSet=tilemap_get_tileset(_tileID);
		for (var k=0;k<array_length(validAnimatingTiles);k++)
		{
			if _tileSet==validAnimatingTiles[k][0]
			{
				ds_list_add(animatedTiles,[_layers[i],k]);
				break;
			}
		}
	}
	setTileAnimations(global.alive);
}