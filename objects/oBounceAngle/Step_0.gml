/// @description Touch objects
if image_index==0
{
	if roomHasPower()&&place_meeting(x,y,oPhysicsObj)
	{
		var _o=instance_place(x,y,oPhysicsObj);
		_o.x=x;
		_o.y=y-6;
		_o.vsp=min(bounceVsp,_o.vsp);
		if isObj(_o,ply) shake(1,1,10);
		if isObj(_o,npc)||isObj(_o,ply)
		{
			_o.state=moveState.jumping;
		}
		else _o.state=moveState.falling;
		_o.xscale=image_xscale
		_o.canMove=false;
		ds_list_add(movingObj,_o)
		image_index=1;
		alarm[0]=resetTime;
	}
}

for (var i=0;i<ds_list_size(movingObj);i++)
{
	var _o=movingObj[|i];
	if !instance_exists(_o)
	{
		ds_list_delete(movingObj,i);
		i--;
		continue;
	}
	_o.hsp=image_xscale*bounceHsp;
	if _o.state<moveState.jumping
	{
		_o.canMove=true;
		ds_list_delete(movingObj,i);
		i--;
	}
}