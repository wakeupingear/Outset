function setRoomLighting(roomName){
	global.lightAlpha=0;
	controller.darknessAlpha=1;
	if !variable_struct_exists(global.rooms,roomName) global.lightAlpha=0;
	else if variable_struct_exists(global.rooms[$ roomName],"darkness") global.lightAlpha=global.rooms[$ roomName].darkness;
	else
	{
		switch roomName
		{
			case "rWastesFactoryOutside": break;
			default:
				switch global.rooms[$ roomName].region
				{
					case worldRegion.west:
						if string_contains(roomName,"Factory")&&!roomHasPower("factory") global.lightAlpha=0.55;
						break;
					default:
						if global.rooms[$ roomName].inside break;
						if global.timeOfDay==times.night
						{
							global.lightAlpha=0.45;
						}
						else if global.timeOfDay==times.sunset global.lightAlpha=0.2;
						else global.lightAlpha=0;
						break;
				}
				break;
		}
	}
}