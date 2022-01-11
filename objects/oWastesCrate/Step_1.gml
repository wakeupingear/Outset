/// @description Move
if global.alive
{
	if moving{
		var _ang=point_direction(x,y,xTo,yTo);
		x+=lengthdir_x(spd,_ang);
		y+=lengthdir_y(spd,_ang);
		if distance_to_point(xTo,yTo)<spd {
			x=xTo;
			y=yTo;
			moving=false;
		}
	}
	else simplePhysics();
	hit.x=x+(sprite_width-sprite_get_xoffset(sprite_index));
	hit.y=y+(sprite_height-sprite_get_yoffset(sprite_index));
}