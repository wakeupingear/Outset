/// @description AI

if global.alive&&instance_exists(ply)
{
	if mode==0
	{
		gunBlend=c_white;
		var _dist=xscale*(ply.x-x)+yscale*(ply.y-y+8);
		if abs(_dist)<14&&sign((y+yscale*4)-ply.y)==yscale
		{
			mode=0.8;
			alarm[3]=20;
		}
	}
	else if mode==4.8
	{
		gunBlend=c_red;
		alarm[3]=-1;
		var _m=instance_create_depth(x,y-4,depth-1,oMissile);
		_m.xDir=xscale;
		_m.yDir=-yscale;
		_m.spd=6;
		mode=0.2;
		alarm[4]=80;
		var _e=instance_create_depth(x+xscale*8,y-yscale*12,depth-2,oExplosion);
	}
}
event_inherited();

