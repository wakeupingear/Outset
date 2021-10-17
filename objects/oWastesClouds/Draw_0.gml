/// @description Draw clouds
var _x=x;
var _y=y;
var _dir=1;
while image_angle>=360 image_angle-=360;
while image_angle<0 image_angle+=360;
if image_angle>=90&&image_angle<215 _dir=-1;
for (var i=0;i<7/abs(image_xscale);i++) //add 1 when tiling for -xscale
{
	_x=x+lengthdir_x(i*tileWidth+lerpProgX*_dir,image_angle)*_dir+lengthdir_x(lerpProgY*_dir,image_angle+270)*_dir;
	_y=y+lengthdir_y(i*tileWidth+lerpProgX*_dir,image_angle)*_dir+lengthdir_y(lerpProgY*_dir,image_angle+270)*_dir;
	draw_sprite_ext(sprite_index,0,_x,_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha*alpha);
	for (var j=1;j<2/abs(image_xscale);j++)
	{
		_y+=lengthdir_y(sprite_height,(image_angle+270));
		_x+=lengthdir_x(sprite_height,(image_angle+270));
		draw_sprite_ext(sprite_index,1,_x,_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha*alpha);
	}
}