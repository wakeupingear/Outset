roomStruct=global.rooms[$ room_get_name(room)];
if is_undefined(roomStruct) instance_destroy();
else
{
	music=roomStruct.music;
	if is_undefined(music)||music==-1 instance_destroy();
}
st=0;