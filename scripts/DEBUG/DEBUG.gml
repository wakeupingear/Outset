function DEBUG_moveNPC(npcName,roomID,location,delayTime){
	show_debug_message("Moving NPC "+npcName+" to "+location);
	var _str={key:["$"+npcName+".setRoom",[room_get_name(roomID),location]],delay: delayTime,args:[]};
	createCutsceneDelay(_str,"cutsceneDelay");
}

function DEBUG_getNPCLocation(npcName){
	return global.characterLocations[? npcName][4];
}