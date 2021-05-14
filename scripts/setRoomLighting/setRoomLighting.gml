

function setRoomLighting(roomName){
	if !variable_struct_exists(global.rooms,roomName) global.lightAlpha=0;
	else if variable_struct_exists(global.rooms[$ roomName],"darkness") global.lightAlpha=global.rooms[$ roomName].darkness;
	else if !global.rooms[$ roomName].inside
	{
		if global.timeOfDay==times.night
		{
			global.lightAlpha=0.6;
		}
		else if global.timeOfDay==times.sunset global.lightAlpha=0.3;
		else global.lightAlpha=0;
	}
	else global.lightAlpha=0;
}