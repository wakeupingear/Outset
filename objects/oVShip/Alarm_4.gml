/// @description Fire missile
if !global.alive alarm[4]=1;
else
{
	if guns[fireSide]==1
	{
		var _xs=((fireSide==1)-(fireSide==0));
		var _g=instance_create_layer(oCamera.x+irandom_range(30,140)*_xs,camY()-32,"people",oMissile);
		_g.scope=true;
		_g.yDir=1;
		_g.xDir=0;
		_g.hitTerrain=2;
		_g.image_index=1;
	}
	else if guns[fireSide]==2
	{
		
	}
	else if guns[fireSide]==3
	{
		var _xs=((fireSide==1)-(fireSide==0));
		var _sy=camX()+108;
		if instance_exists(ply) _sy=ply.y;
		var _g=instance_create_layer(oCamera.x+240*_xs,_sy+irandom_range(-32,32),"people",oMissile);
		_g.scope=true;
		_g.xDir=-_xs;
		_g.hitTerrain=false;
		_g.image_index=1;
	}
	
	
	fireSide=1-fireSide;
	alarm[4]=120;
}