/// @description Set current text
var _l=global.characterLocations[? npcKey][4];
if location!=_l&&global.characterLocations[? npcKey][2]==room
{
	text=[];
	if variable_struct_exists(global.langScript,npcKey+"_"+_l+"_"+"auto") conversation(textLoad(npcKey+"_"+_l+"_"+"auto"));
	if variable_struct_exists(global.langScript,npcKey+"_"+_l) text=textLoad(npcKey+"_"+_l);
	else if variable_struct_exists(global.langScript,npcKey+"_"+_l+"_"+"idle") text=textLoad(npcKey+"_"+_l+"_"+"idle");
	else switch (room)
	{
		default: break;
	}
	location=_l;
	positionNpc(false); //reset visual stuff
}