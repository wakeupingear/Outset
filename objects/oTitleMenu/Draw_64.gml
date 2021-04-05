/// @description Text
if fade==0
{
	setFont(fontSizes.small);
	draw_set_alpha(textAlpha);
	draw_text(192*guiX()-string_width(text[0])/2,110*guiY(),text[0]);
	draw_set_alpha(1);
	setFont(fontSizes.medium);
}