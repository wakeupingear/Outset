/// @description Text
if mode==0
{
	if contentMode==1&&fade==1
	{
		if contentText=="" contentText=textLoad("pro_slateTOS");
		surface_set_target(global.guiSurf);
		draw_text(toGuiX(x-74),toGuiY(y-74),string_copy(contentText[0],1,floor(textInd)));
		if textInd<string_length(contentText[0]) textInd+=1/0.5;
		else 
		{
			doneTyping=true
			draw_text(toGuiX(x)-round(string_width(contentText[1])/2),toGuiY(y+58),contentText[1]);
		}
		gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(sprite_index,1,toGuiX(x),toGuiY(y),guiX(),guiY(),0,-1,1);
		gpu_set_blendmode(bm_normal);
		surface_reset_target();
	}
}
