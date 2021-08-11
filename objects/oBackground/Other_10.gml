/// @description Position
if tileWidth==-1
{
	tileWidth=abs(sprite_width);
	tileHeight=abs(sprite_height);
}

x=camX()*xLerp+xOff;
y=camY()*yLerp+yOff;

if tileX while x>0 x-=tileWidth;
if tileY while y>0 y-=tileHeight;