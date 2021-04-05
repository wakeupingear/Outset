/// @description Check if state has changed
if instance_exists(oTerrain)&&!array_equals(state,[x,y,sprite_index,image_index,image_angle])
{
	renderTerrain();
	state=[x,y,sprite_index,image_index,image_angle];
}
//if mouse_check_button_pressed(mb_left)&&place_meeting(x,y,oMouse) instance_destroy();