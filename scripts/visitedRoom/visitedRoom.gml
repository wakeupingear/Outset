function visitedRoom(roomID){
	return ds_list_find_index(global.visitedRooms,roomID)>-1;
}