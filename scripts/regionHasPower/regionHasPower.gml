function roomHasPower(roomRegion){
	if is_undefined(roomRegion) roomRegion=global.rooms[$ room_get_name(room)].region
	switch roomRegion
	{
		case worldRegion.notdon: return !hasData("notdonPowerless");
		default: return true;
	}
}