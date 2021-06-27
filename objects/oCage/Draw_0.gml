/// @description Draw
if behind!=empty
{
	var _x=x+round(lengthdir_x(behindOriginY,image_angle-90));
	var _xs=xscale;
	if facePlayer==1&&instance_exists(ply) _xs=(_x>ply.x)-(_x<ply.x)+(_x==ply.x);
	var _y=y+round(lengthdir_y(behindOriginY,image_angle-90));
	draw_sprite_ext(behind,behindInd,
	_x,_y,
	_xs,1,image_angle,-1,image_alpha);
}

draw_self();