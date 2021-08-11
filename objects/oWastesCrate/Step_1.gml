/// @description Move
if global.alive
{
	simplePhysics();
	hit.y=y+(sprite_height-sprite_get_yoffset(sprite_index));
}