/// @description Create clouds
surf=-1;
surf2=-1;

image_blend=merge_color(c_white,c_yellow,0.2);

clouds=ds_list_create();
for (var i=0.4;i<=1;i+=0.2)
{
	var _c=instance_create_layer(0,0,"bg2",oClouds);
	//_c.image_alpha=i+0.3;
	_c.image_blend=merge_color(c_white,c_black,min(1-i*0.4,1));
	_c.sprite_index=sAirClouds;
	_c.image_xscale=i;
	_c.image_yscale=image_xscale;
	_c.spd=-i*2.5;
	_c.yOff-=i*100;
	_c.xLerp=1-i;
	_c.yLerp=_c.xLerp;
	_c.canDraw=false;
	ds_list_add(clouds,_c);
}

mask_index=sPlySprite;
cloudColl=function(){
	if !instance_exists(ply) return !collision_point(global.plyX,global.plyY,airHitobj,true,true);
	return !collision_point(ply.x,ply.y,airHitobj,true,true);
}
cloudRippleProg=0;
fogAlpha=0.5;
fogProg=cloudColl();
fogSpd=0.02;
fogTime=0;