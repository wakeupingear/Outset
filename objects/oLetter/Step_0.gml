/// @description Position
x=camX()+xOff;
y=camY()+yOff;

if active {
if !selected hover=place_meeting(x,y,oCursor);
else hover=false;
}