npcKey="";
location="";
if !positionNpc(1) instance_destroy();
else {
npcMovementVars();
if object_is_ancestor(object_index,enem) 
{
	hsp=0;
	vsp=-5;
	npcHealthVars();
}
else 
{
	text=[];
	lastSentence=-1; //for random selections in Idle conversation
	npcAnimVars();
	event_user(0);
	
	var _rN=room_get_name(room);
	var _st=global.characters[$ npcKey].locations[$ _rN][$ global.characterLocations[? npcKey][4]];
	if variable_struct_exists(_st,"path")
	{
		pathfindingStart(id,_st[$ "path"]);
	}
	
	while groundCollision(x,y) y--;
}
}