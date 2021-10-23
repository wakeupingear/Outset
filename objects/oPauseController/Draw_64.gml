/// @description Draw text

surface_set_target(global.guiSurf);
with oPauseControllerInput
{
	var _col=(selected?c_orange: c_white);
	draw_text_color(round(x*guiX()-textWidth/2),round(y*guiY()-string_height(text)/2),text,
	_col,_col,_col,_col,sqrt(image_alpha));
}
surface_reset_target();