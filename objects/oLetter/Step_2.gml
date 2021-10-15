/// @description Position
x=camX()+xOff;
y=camY()+yOff;

if active {
if !selected 
{
	hover=place_meeting(x,y,oCursor);
	if hover
	{
		with oLetter selected=false;
		selected=true;
	}
}
else hover=false;
}