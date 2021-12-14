function setTerrain(){
	if room!=rStartup&&room!=rTitle 
	{
		var _layerNames=layer_get_all();
		var _layers=[];
		var _depth=10000;
		for (var i=0;i<array_length(_layerNames);i++)
		{
			show_debug_message(layer_get_name(_layerNames[i]))
			if !layer_exists(_layerNames[i]) continue;
			var _n=string_lower(layer_get_name(_layerNames[i]));
			if _n=="terrain"||(_n=="myko"&&layer_exists(layer_get_id("mykoTile")))||(layer_get_visible(_layerNames[i])&&string_pos("terrain",_n)>0)
			{
				array_push(_layers,_layerNames[i]);
				if layer_get_depth(_layerNames[i])<_depth _depth=layer_get_depth(_layerNames[i]);
			}
		}
		if array_length(_layerNames)>0
		{
			if instance_exists(oTerrain) instance_destroy(oTerrain)
		
			for (var k=0;k<array_length(_layers);k++)
			{
				if !layer_exists(_layers[k]) continue;
				var _currentTerrain=-1;
				var _name=layer_get_name(_layers[k]);
				var _assets=layer_get_all_elements(_layers[k]);
				var _isEraTerrain=(string_pos("hit",string_lower(_name))>0);
				if array_length(_assets)>0
				{
					var _objType=hitobj;
					if _isEraTerrain _objType=oTerrainHitobj;
					var _nameNum=string_digits(_name)
					 if (_nameNum!=""&&string_letters(_name)=="terrain")
					{
						_currentTerrain=instance_create_depth(0,0,_depth-2+4*(string_pos("below",string_lower(_name))>0),oTerrain);
						_currentTerrain.roomRegion=int64(_nameNum);
						with _currentTerrain event_user(0);
					}
					else _currentTerrain=instance_create_layer(0,0,_layers[k],oTerrain);
					_currentTerrain.layerName=_name;
					if _name=="myko" 
					{
						global.mykoTerrain=_currentTerrain;
						with oSoulBranchHit ds_list_add(global.mykoTerrain.terrain,id);
					}
					for (var i=0;i<array_length(_assets);i++)
					{
						if sTerrainNoHit==layer_sprite_get_sprite(_assets[i])||_name=="terrainNohit" var _i=instance_create_depth(layer_sprite_get_x(_assets[i]),layer_sprite_get_y(_assets[i]),layer_get_depth(_layers[k]),oPlaceholder);
						else var _i=instance_create_depth(layer_sprite_get_x(_assets[i]),layer_sprite_get_y(_assets[i]),layer_get_depth(_layers[k]),_objType);
						_i.sprite_index=layer_sprite_get_sprite(_assets[i]);
						if array_pos(_currentTerrain.terrainSprites,_i.sprite_index)==-1 array_push(_currentTerrain.terrainSprites,_i.sprite_index);
						_i.image_index=layer_sprite_get_index(_assets[i]);
						_i.image_blend=layer_sprite_get_blend(_assets[i]);
						_i.image_xscale=layer_sprite_get_xscale(_assets[i]);
						_i.image_yscale=layer_sprite_get_yscale(_assets[i]);
						_i.image_angle=layer_sprite_get_angle(_assets[i]);
						layer_sprite_alpha(_assets[i],0);
						if _name=="terrainSprites"
						{
							_i.image_alpha=1;
							_i.image_speed=1;
							_i.visible=true;
						}
						else
						{
							_i.visible=false;
							ds_list_add(_currentTerrain.terrain,_i);
						}
					}
					_currentTerrain.visible=layer_get_visible(_layers[k]);
				}
				if _isEraTerrain layer_set_visible(_layers[k],false);
			}
		}
		
		if instance_exists(enemWall) with enemWall ds_list_add(oTerrain.terrain,_i);
		
		//if instance_exists(oTerrain)&&ds_list_size(oTerrain.terrain)==0 instance_destroy(oTerrain);
	}
}