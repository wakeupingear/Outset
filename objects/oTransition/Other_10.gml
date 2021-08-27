/// @description Set animation specific stuff
switch room
{
	case rWastesBorder:	
		if ply.x>room_width image_blend=regionColor[worldRegion.notdon];
		else image_blend=regionColor[worldRegion.west];
		break;
	default: 
		image_blend=regionColor[global.rooms[$ room_get_name(room)].region];
		break;
}
switch (transition)
{
	case transitions.blackToBlack:
		image_alpha=0;
		transition = (global.rooms[$ room_get_name(room)].inside&&!global.rooms[$ room_get_name(global.nextRoom)].inside&&global.timeOfDay!=times.night);
		break;
	case transitions.blackToWhite:
	case transitions.whiteToWhite:
	case transitions.whiteSudden:
	case transitions.blackSudden:
		image_alpha=0;
		break;
	default: break;
}