/// @description Set facing
if behind!=empty 
{
	var _n=string_lower(sprite_get_name(behind));
	if facePlayer==-1&&(string_contains(_n,"person")||string_contains(_n,"npc")) facePlayer=1;
}