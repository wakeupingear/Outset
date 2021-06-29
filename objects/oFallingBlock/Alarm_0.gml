/// @description Fall
var _num=7;
var _yOff=sprite_get_yoffset(sprite_index);
for (var i=-floor(_num/2);i<ceil(_num/2);i++)
{
	particle(x+round(i*abs(sprite_width)/2),y-_yOff+abs(sprite_height)-yRemoved,depth,sPlaceholderPixelG,0,{
	
	});
}

yRemoved++;
if yRemoved==abs(sprite_height)
{
	alarm[1]=respwanTime;
	y=-100;
}
else
{
	alarm[0]=spd;
}