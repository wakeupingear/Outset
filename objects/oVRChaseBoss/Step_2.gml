/// @description Move
if global.alive&&!global.menuOpen{
if (camX()+384<room_width)
{
	if x<camX()+xOff x=camX()+xOff;
	else x++;
}
else
{
	if (x>camX()+xOff*2) x-=0.5;
}
}