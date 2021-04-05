/// @description Position
x=camX()*xLerp+xOff;
y=camY()*yLerp+yOff;

if tile
{
	while x>0 x-=tileWidth;
	while y>0 y-=tileHeight;
}