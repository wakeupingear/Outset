// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_surface_create(_x,_y){
	if os_type==os_linux
	{
		var v=max(_x,_y);
		v--;
		v |= v >> 1;
		v |= v >> 2;
		v |= v >> 4;
		v |= v >> 8;
		v |= v >> 16;
		v++;
		return surface_create(v,v);
	}
	return surface_create(_x,_y);
}