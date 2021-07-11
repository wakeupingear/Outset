if global.alive image_speed=1;
else
{
	image_speed=0;
	pauseAlarms(0);
}
show_debug_message(image_index)