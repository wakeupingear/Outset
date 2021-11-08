/// @description Set position
if instance_exists(target)
{
	x=target.x;
	y=target.y;
}

var _xD=round(x-xprevious);
if currentTarget!=target
{
	_xD=0;
	currentTarget=target;
}
image_angle=_xD*6;