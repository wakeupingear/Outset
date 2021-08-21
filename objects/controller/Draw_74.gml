/// @description Set up guiSurf
if !surface_exists(global.guiSurf)||surface_get_height(global.guiSurf)!=1080*global.guiScale||surface_get_width(global.guiSurf)!=1920*global.guiScale
{
	if surface_exists(global.guiSurf) surface_free(global.guiSurf);
	global.guiSurf=scr_surface_create(ceil(1920*global.guiScale),ceil(1080*global.guiScale));
}

surface_set_target(global.guiSurf);
draw_clear_alpha(c_black,0);
surface_reset_target();