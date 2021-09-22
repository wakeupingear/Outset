/// @description Set up guiSurf
if !surface_exists(global.guiSurf)||surface_get_height(global.guiSurf)!=1080*global.guiScale||surface_get_width(global.guiSurf)!=1920*global.guiScale
{
	if surface_exists(global.guiSurf) surface_free(global.guiSurf);
	global.guiSurf=surface_create(ceil(1920*global.guiScale),ceil(1080*global.guiScale));
}

surface_set_target(global.guiSurf);
draw_clear_alpha(c_black,0);
if alarm[3]>-1 draw_text_outline(toGuiX(camX()+320),toGuiY(camY()+16),string(alarm[3] div 60)+":"+string_format(round((alarm[3]%60)/60*100),2,0),8,16);
surface_reset_target();