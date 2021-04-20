// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createNPCs(){
	var _rName=room_get_name(room);
	//if !is_undefined(global.rooms[$ _rName])&&variable_struct_exists(global.rooms[$ _rName],"npcs")
	{
		var _npcNames=variable_struct_get_names(global.characters);
		for (var i=0;i<array_length(_npcNames);i++) 
		{
			///if !instance_exists(asset_get_index(_npcNames)) instance_create_layer(0,0,"people",global.rooms[$ _rName].npcs[i]);
			if global.characterLocations[? _npcNames[i]][2]==room instance_create_layer(0,0,"people",asset_get_index("npc"+capitalizeFirstLetter(_npcNames[i])));
		}
	}
}