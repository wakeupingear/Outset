/// @description Souldrop
repeat soulNum
{
	var _w=abs(sprite_width/2);
	var _h=abs(sprite_height/2);
	var _c=instance_create_depth(x+irandom_range(-_w,_w),y+irandom_range(-_h,_h),depth-1,oSouldropCoin);
	_c.staticCoin=false;
}