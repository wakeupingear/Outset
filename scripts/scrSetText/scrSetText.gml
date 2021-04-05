// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrSetText(){
	global.regions=textLoad("regions");
	//room names
	var _n=variable_struct_get_names(global.langScript[$ "roomNames"]);
	try for (var i=0;i<array_length(_n);i++)
	{
		global.rooms[$ _n[i]].name=global.langScript[$ "roomNames"][$ _n[i]];
	}
	catch(_exception) show_debug_message("Error: Room not added to text file");
	
	//items
	var _i=global.langScript[$ "itemText"];
	var _iKeys=[];
	ds_map_keys_to_array(global.itemData,_iKeys)
	try
	{
		for (var i=0;i<array_length(_iKeys);i++)
		{
			global.itemData[? _iKeys[i]].itemName=_i[$ _iKeys[i]][0];
			global.itemData[? _iKeys[i]].flavortext=_i[$ _iKeys[i]][1];
		}
	}
	catch(_exception) show_error("Error: An item's text isn't set properly in the text file",true);
	
	//interactions
	global.interactTextLabels=global.langScript[$ "textInteract"];
	
	//character names
	global.characterNames=global.langScript[$ "names"];
	
}