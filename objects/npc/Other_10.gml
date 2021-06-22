/// @description Set current text
var _l=global.characterLocations[? npcKey][4];
if location!=_l&&global.characterLocations[? npcKey][2]==room
{
	text=[];
	var _n=capitalizeFirstLetter(npcKey);
	if variable_struct_exists(global.langScript,_l+_n+"Auto") conversation(textLoad(_l+_n+"Auto"));
	if variable_struct_exists(global.langScript,_l+_n) text=textLoad(_l+_n);
	else if variable_struct_exists(global.langScript,_l+_n+"Idle") text=textLoad(_l+_n+"Idle");
	else switch (room)
	{
		default: break;
	}
	location=_l;
}