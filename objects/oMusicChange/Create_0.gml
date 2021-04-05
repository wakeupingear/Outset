music=global.rooms[$ room_get_name(room)]
if is_undefined(music) instance_destroy();
else
{
	music=music.music;
	if is_undefined(music)||music==-1 instance_destroy();
}
st=0;