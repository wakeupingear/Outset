function setNPCRoom(npcName,roomName,key){
	var _lastKey=global.characterLocations[? npcName][4];
	var _struct=global.characters[$ npcName].locations[$ roomName][$ key];
	global.characterLocations[? npcName][0]=_struct.startX;
	global.characterLocations[? npcName][1]=_struct.startY;
	global.characterLocations[? npcName][2]=asset_get_index(roomName);
	global.characterLocations[? npcName][4]=key;
	var _obj=asset_get_index("npc"+string_upper(string_char_at(npcName,1))+string_copy(npcName,2,string_length(npcName)-1));
	var _rm=room_get_name(room);
	if instance_exists(_obj)&&variable_struct_exists(_struct,"pathFrom")&&variable_struct_exists(_struct.pathFrom,_rm)&&variable_struct_exists(_struct.pathFrom[$ _rm],_lastKey)
	{
		pathfindingStart(_obj,_struct.pathFrom[$ _rm][$ _lastKey].path);
	}
	else if _rm==roomName&&variable_struct_exists(_struct,"path")
	{
		pathfindingStart(_obj,_struct.path);
	}
	if instance_exists(_obj) 
	{
		with _obj event_user(0);
	}
	if instance_exists(_obj)&&variable_struct_exists(_struct,"pathFrom")&&variable_struct_exists(_struct.pathFrom,_rm)&&variable_struct_exists(_struct.pathFrom[$ _rm],_lastKey)
	{
		if variable_struct_exists(_struct.pathFrom[$ _rm][$ _lastKey],"text") _obj.text=textLoad(_struct.pathFrom[$ _rm][$ _lastKey].text);
	}
}