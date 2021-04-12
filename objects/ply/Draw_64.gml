/// @description Draw and reset interactText
if global.interactText==-1&&interactTextAlpha>0
{
	interactTextAlpha-=0.1;
	drawInteract();
}
else if global.interactText>-1
{
	interactTextLast=global.interactText;
	if interactTextAlpha<1 interactTextAlpha+=0.1;
	drawInteract()
}
global.interactText=-1;

if global.inWater
{
	if breathAlpha<1 breathAlpha+=0.1;
}
else if breathAlpha>0 breathAlpha-=0.1;

if breathAlpha>0&&interactTextAlpha==0
{
	var _text=string(ceil(max(breath,0)));
	surface_set_target(global.guiSurf);
	draw_text_color(toGuiX(x)-string_width(_text)/2,toGuiY(y-20),_text,c_nearWhite,c_nearWhite,c_nearWhite,c_nearWhite,breathAlpha);
	surface_reset_target();
}