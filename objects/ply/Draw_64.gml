/// @description Draw and reset interactText
if (global.interactText==-1||global.menuOpen||instance_exists(oButtonPrompt))&&interactTextAlpha>0
{
	interactTextAlpha-=0.1;
	drawInteract();
}
else if global.interactText>-1
{
	interactTextLast=global.interactText;
	if interactTextAlpha<1 interactTextAlpha+=0.1;
	drawInteract();
}
global.interactText=-1;

if global.inWater&&!global.menuOpen
{
	if breathAlpha<1 breathAlpha+=0.1;
}
else if breathAlpha>0 breathAlpha-=0.1;

if breathAlpha>0&&interactTextAlpha==0
{
	var _text=string(ceil(max(breath,0)));
	surface_set_target(global.guiSurf);
	draw_text_outline_transformed_color(toGuiX(x)-string_width(_text)/2,toGuiY(y-22),_text,c_nearWhite,c_nearWhite,breathAlpha,c_nearBlack,c_nearBlack,breathAlpha,6*global.guiScale,12,1,1,0);
	surface_reset_target();
}