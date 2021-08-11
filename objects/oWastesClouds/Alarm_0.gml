/// @description Create bottom background
setBGPosition(x,y);
image_blend=merge_color(make_color_rgb(39,196,75),c_black,(xLerp-0.4)*1.5);
var _num=ceil((room_height-yLerp*camY())/sprite_height);
for (var i=0;i<_num;i++)
{
	var _b=instance_create_depth(x,y,depth,oWastesClouds);
	_b.sprite_index=sprite_index;
	_b.image_index=1;
	_b.image_blend=image_blend;
	_b.alarm[0]=-1;
	_b.xLerp=xLerp;
	_b.yLerp=yLerp;
	_b.image_xscale=image_xscale;
	_b.image_yscale=image_yscale;
	with _b 
	{
		width=abs(sprite_width);
		height=abs(sprite_height);
		setBGPosition(x,y);
	}
	_b.xOff=xOff;
	_b.yOff+=(i+1)*sprite_height;
	array_push(bottomClouds,_b);
}
origXLerp=-1;

width=abs(sprite_width);
height=abs(sprite_height);