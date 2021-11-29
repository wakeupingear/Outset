/// @description Create clouds
surf=-1;
surf2=-1;

clouds=ds_list_create();
for (var i=0.4;i<=0.8;i+=0.2)
{
	var _c=instance_create_layer(0,0,"bg2",oClouds);
	//_c.image_alpha=i+0.3;
	_c.image_blend=merge_color(c_white,c_black,min(1-i*0.4,1));
	_c.sprite_index=sAirClouds;
	_c.spd=i*2.5;
	_c.yOff-=i*100;
	_c.xLerp=1-i;
	_c.yLerp=_c.xLerp;
	_c.canDraw=false;
	ds_list_add(clouds,_c);
}