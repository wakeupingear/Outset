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