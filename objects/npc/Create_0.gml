	image_speed=0;

npcKey="";
location="";
text=[];
deadText=[];
npcMovementVars();
npcAnimVars();
if !positionNpc(1) instance_destroy();
else {
if object_is_ancestor(object_index,enem) 
{
	npcHealthVars();
}
else
{
	lastSentence=-1; //for random selections in Idle conversation
	event_user(0);
	
	var _rN=room_get_name(room);
	var _st=global.characters[$ npcKey].locations[$ _rN][$ global.characterLocations[? npcKey][4]];
	if variable_struct_exists(_st,"path")
	{
		pathfindingStart(id,_st[$ "path"]);
	}
	
	//while groundCollision(x,y) y--;
}
}