// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createNPCs(){
	var _rName=room_get_name(room);
	if !is_undefined(global.rooms[$ _rName])&&variable_struct_exists(global.rooms[$ _rName],"npcs")
	{
		for (var i=0;i<array_length(global.rooms[$ _rName].npcs);i++) 
		{
			if !instance_exists(global.rooms[$ _rName].npcs[i]) instance_create_layer(0,0,"people",global.rooms[$ _rName].npcs[i]);
		}
	}
}