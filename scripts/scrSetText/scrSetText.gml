

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
	global.itemText=global.langScript[$ "itemText"];
	var _iKeys=[];
	ds_map_keys_to_array(global.itemData,_iKeys)
	try
	{
		for (var i=0;i<array_length(_iKeys);i++)
		{
			if variable_struct_exists(global.itemText,string_letters(_iKeys[i]))
			{
				var _newStr=string_letters(_iKeys[i]);
				global.itemData[? _iKeys[i]].itemName=global.itemText[$ _newStr][0];
				global.itemData[? _iKeys[i]].flavortext=global.itemText[$ _newStr][1];
			}
			else
			{
				global.itemData[? _iKeys[i]].itemName=global.itemText[$ _iKeys[i]][0];
				global.itemData[? _iKeys[i]].flavortext=global.itemText[$ _iKeys[i]][1];
			}
		}
	}
	catch(_exception) show_error("Error: An item's text isn't set properly in the text file",true);
	
	//interactions
	global.interactTextLabels=global.langScript[$ "textInteract"];
	
	//character names
	global.characterNames=global.langScript[$ "names"];
	
	//buttons
	global.buttonText=textLoad("buttonText");
}