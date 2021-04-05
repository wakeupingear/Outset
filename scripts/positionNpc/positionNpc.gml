// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function positionNpc(moveToLocation){ //0= don't, 1=do, 2=pathfind
	if object_is_ancestor(object_index,enem) return true;
	npcKey=string_lower(string_replace(object_get_name(object_index),"npc",""));
	if global.characterLocations[? npcKey][2]!=room return false;
	if instance_number(object_index)>1
	{
		//might want to override this in some cases
		return false;
	}
	if moveToLocation==1
	{
		x=global.characterLocations[? npcKey][0];
		y=global.characterLocations[? npcKey][1];
	}
	else if moveToLocation==2
	{
		
	}
	var _rm=room_get_name(room);
	check=global.characters[$ npcKey].ch;
	xscale=global.characters[$ npcKey].locations[$ _rm][$ global.characterLocations[? npcKey][4]].xs;
	if xscale==0 
	{
		facePlayer=true;
		xscale=1;
	}
	else facePlayer=false;
	yscale=global.characters[$ npcKey].locations[$ _rm][$ global.characterLocations[? npcKey][4]].ys;
	return true;
}