/// @description Fire missile
if !global.alive alarm[4]=1;
else
{
	if guns[fireSide]==1
	{
		
	}
	else if guns[fireSide]==2
	{
		
	}
	else if guns[fireSide]==3
	{
		var _xs=((fireSide==1)-(fireSide==0));
		var _g=instance_create_layer(oCamera.x+240*_xs,ply.y+irandom_range(-32,32),"people",oMissile);
		_g.scope=true;
		_g.xDir=-_xs;
		_g.hitTerrain=false;
		_g.image_index=1;
	}
	
	
	fireSide=1-fireSide;
	alarm[4]=120;
}