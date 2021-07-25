/// @description Text
if fade==0&&showHud
{
	setFont(fontSizes.small);
	draw_set_alpha(textAlpha);
	draw_text(192*guiX()-string_width(text[0])/2,110*guiY(),text[0]);
	draw_set_alpha(1);
	setFont(fontSizes.medium);
}
else if fade==1
{
	surface_set_target(global.guiSurf);
	with oTitleFile drawGUI();
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sprite_index,6,toGuiX(192),toGuiY(108),guiX(),guiY(),0,-1,1);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}