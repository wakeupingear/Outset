function scrCreateWastesBuildings(){
	var _layers=layer_get_all(); //set current era layer to active
	for (var k=0;k<array_length(_layers);k++)
	{
		if layer_get_visible(_layers[k])&&string_pos("building",string_lower(layer_get_name(_layers[k])))>0
		{
			var _assets=layer_get_all_elements(_layers[k]);
			for (var i=0;i<array_length(_assets);i++)
			{
				var _i=instance_create_depth(layer_sprite_get_x(_assets[i]),layer_sprite_get_y(_assets[i]),layer_get_depth(_layers[k])+1,oWastesBuilding);
				_i.sprite_index=layer_sprite_get_sprite(_assets[i]);
				_i.image_blend=layer_sprite_get_blend(_assets[i]);
				_i.image_xscale=layer_sprite_get_xscale(_assets[i]);
				_i.image_yscale=layer_sprite_get_yscale(_assets[i]);
				_i.image_angle=layer_sprite_get_angle(_assets[i]);
			}
			layer_set_visible(_layers[k],false);
		}
	}
}