/// @description Move
if global.alive
{
	if instance_exists(hit) hit.y=-1000;
	if moving{
		var _ang=point_direction(x,y,xTo,yTo);
		x+=lengthdir_x(spd,_ang);
		y+=lengthdir_y(spd,_ang);
		if distance_to_point(xTo,yTo)<=0.5 {
			x=xTo;
			y=yTo;
			moving=false;
		}
	}
	else simplePhysics();
	if (y!=yprevious||x!=xprevious)&&place_meeting(x,y,oPhysicsObj){
		var _xD=sign(x-xprevious);
		var _yD=sign(y-yprevious);
		var _i=id;
		while place_meeting(x,y,oPhysicsObj){
			with instance_place(x,y,oPhysicsObj){
				while place_meeting(x,y,_i){
					x+=_xD;
					y+=_yD;
				}
			}
		}
	}
	if instance_exists(hit){
		hit.x=x-(sprite_width-sprite_get_xoffset(sprite_index));
		hit.y=y+(sprite_height-sprite_get_yoffset(sprite_index));
	}
}