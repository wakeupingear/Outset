/// @description Position, taking angle into account
while image_angle<0 image_angle+=360;
if tileWidth==-1
{
	tileWidth=abs(sprite_width);
	tileHeight=abs(sprite_height);
}

x=camX()*xLerp+xOff;
y=camY()*yLerp+yOff;

do
{
	var _xChange=lengthdir_x(tileWidth,image_angle);
	x-=abs(_xChange);
	if _xChange==0 _xChange=sign(image_angle-180);
	y-=lengthdir_y(tileWidth,image_angle)*sign(_xChange);
}
until !inFrame(x,y);