/// @description Text
if text!=""&&stackType!=1
{
	if !surface_exists(textSurf) 
	{
		textSurf=surface_create(ceil(guiX()*sprite_get_width(sprite_index)),ceil(guiY()*sprite_get_height(sprite_index)));
		surface_set_target(textSurf);
		var _fontOrig=draw_get_font();
		for (var i=0;i<array_length(text);i++)
		{
			if variable_struct_exists(text[i],"font") draw_set_font(text[i].font);
			draw_text_color(round(text[i].xPos*guiX()),round(text[i].yPos*guiY()),text[i].text,textCol,textCol,textCol,textCol,1);
		}
		if draw_get_font()!=_fontOrig draw_set_font(_fontOrig);
		surface_reset_target();
	}
	
	surface_set_target(global.guiSurf);
	draw_surface_ext(textSurf,toGuiX(xx-sprite_get_xoffset(sprite_index)),toGuiY(yy-sprite_get_yoffset(sprite_index)),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	surface_reset_target();
}