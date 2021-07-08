/// @description Fall
var _num=round(abs(sprite_width)/2);
var _yOff=sprite_get_yoffset(sprite_index);
for (var i=-_num;i<_num+1;i++)
{
	particle(x+i,y-_yOff+abs(sprite_height)-yRemoved,depth,sPlaceholderPixelG,0,{
		fade:0.05,
		dir: round(i/_num*25)+270,
		spd:1
	});
}

yRemoved++;
if yRemoved>=abs(sprite_height)
{
	alarm[1]=respwanTime;
	y=-100;
}
else
{
	alarm[0]=spd;
}