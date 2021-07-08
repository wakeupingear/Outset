/// @description Create bottom background
setBGPosition(x,y);
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
	with _b setBGPosition(x,y+(i+1)*sprite_height/xLerp);
	_b.xOff=xOff;
	array_push(bottomClouds,_b);
}
origXLerp=-1;