// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setTerrain(){
	var _layerNames=layer_get_all();
	var _layers=[];
	var _depth=10000;
	for (var i=0;i<array_length(_layerNames);i++)
	{
		if layer_get_visible(_layerNames[i])&&string_pos("terrain",string_lower(layer_get_name(_layerNames[i])))>0
		{
			array_push(_layers,_layerNames[i]);
			if layer_get_depth(_layerNames[i])<_depth _depth=layer_get_depth(_layerNames[i]);
		}
	}
	
	if array_length(_layerNames)>0
	{
		if instance_exists(oTerrain) 
		{
			var _t=instance_find(oTerrain,0);
			with _t
			{
				for (var i=0;i<ds_list_size(terrain);i++) if instance_exists(terrain[|i]) instance_destroy(terrain[|i],false);
				for (var i=0;i<ds_list_size(terrainColor);i++) if instance_exists(terrainColor[|i]) instance_destroy(terrainColor[|i],false);
				ds_list_clear(terrain);
				ds_list_clear(terrainColor);
				render=false;
			}
		}
		else var _t=instance_create_depth(0,0,_depth,oTerrain);
		for (var k=0;k<array_length(_layers);k++)
		{
			var _assets=layer_get_all_elements(_layers[k]);
			var _isEraTerrain=(string_pos("hit",string_lower(layer_get_name(_layers[k])))>0);
			if array_length(_assets)>0
			{
				var _objType=hitobj;
				if _isEraTerrain _objType=oTerrainHitobj;
				for (var i=0;i<array_length(_assets);i++)
				{
					var _i=instance_create_depth(layer_sprite_get_x(_assets[i]),layer_sprite_get_y(_assets[i]),layer_get_depth(_layers[k]),_objType);
					_i.sprite_index=layer_sprite_get_sprite(_assets[i]);
					if array_pos(_t.terrainSprites,_i.sprite_index)==-1 array_push(_t.terrainSprites,_i.sprite_index);
					_i.image_index=layer_sprite_get_index(_assets[i]);
					_i.image_blend=layer_sprite_get_blend(_assets[i]);
					_i.image_xscale=layer_sprite_get_xscale(_assets[i]);
					_i.image_yscale=layer_sprite_get_yscale(_assets[i]);
					_i.image_angle=layer_sprite_get_angle(_assets[i]);
					_i.visible=false;
					layer_sprite_alpha(_assets[i],0);
					ds_list_add(_t.terrain,_i);
				}
			}
			if _isEraTerrain layer_set_visible(_layers[k],false);
		}
	}
}