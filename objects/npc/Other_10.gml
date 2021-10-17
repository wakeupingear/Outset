/// @description Set current text
var _l=global.characterLocations[? npcKey][4];
useDefaultAnimations=true;
if location!=_l&&global.characterLocations[? npcKey][2]==room
{
	text=[];
	deadText=[];
	if variable_struct_exists(global.langScript,npcKey+"_"+_l+"_"+"auto") 
	{
		conversation(textLoad(npcKey+"_"+_l+"_"+"auto"));
	}
	//text
	if variable_struct_exists(global.langScript,npcKey+"_"+_l) text=textLoad(npcKey+"_"+_l);
	else if variable_struct_exists(global.langScript,npcKey+"_"+_l+"_"+"idle") text=textLoad(npcKey+"_"+_l+"_"+"idle");
	else switch (room)
	{
		default: break;
	}
	
	//deadText
	if variable_struct_exists(global.langScript,npcKey+"_"+_l+"_dead") deadText=textLoad(npcKey+"_"+_l+"_dead");
	else if variable_struct_exists(global.langScript,npcKey+"_"+_l+"_dead_idle") deadText=textLoad(npcKey+"_"+_l+"_dead_idle");
	location=_l;
	positionNpc(false); //reset visual stuff
	lastState=-1;
	npcAnimation(); //reset animation to default (standing)
}