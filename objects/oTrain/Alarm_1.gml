/// @description Set position
var _data=hasData(string(id));
if _data!=false
{
	position=_data.position;
	dir=position.dir;
	x=points[|position][0];
	y=points[|position][1];
}