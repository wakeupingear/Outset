function respawn(xPos,yPos){
	global.menuOpen=false;
	global.plyX=xPos;
	global.plyY=yPos;
	global.alive=true;
	global.plyHealth=global.maxHealth;
	var _xs=1;
	var _ys=1;
	if instance_exists(oPlayerSoul)
	{
		_xs=oPlayerSoul.xscale;
		_ys=oPlayerSoul.yscale;
		if !ds_map_exists(global.soulDoors,room_get_name(global.dieRoom)) ds_map_add(global.soulDoors,room_get_name(global.dieRoom),[]);
		var _arr=global.soulDoors[? room_get_name(global.dieRoom)];
		array_push(_arr,global.dieX,global.dieY,room,x,y);
		instance_destroy(oPlayerSoul);
	}
	shake(2,2,20);
	for (var i=0;i<instance_number(oSoulBranch);i++) 
	{
		var _i=instance_find(oSoulBranch,i);
		with _i
		{
			if object_index==oSoulButton image_index=1;
			if (active&&((image_xscale!=endXS||image_yscale!=endYS))) active=false;
			else if array_length(children)>0
			{
				var _canReset=true;
				for (var k=0;k<array_length(children);k++) if children[k].stop==-1||array_pos(global.soulButtons,children[k].stop)>-1
				{
					_canReset=false;
					break;
				}
				if _canReset active=false;
			}
			else active=false;
		}
	}
	global.soulButtons=[];
	while instance_exists(oSoulDoor) instance_destroy(oSoulDoor);
	var _p=instance_create_layer(xPos,yPos,"player",ply);
	_p.xscale=_xs;
	_p.yscale=_ys;
		
	if hasData("reacSt") instance_activate_object(oSouldropCoin);
	
	with controller setTileAnimations(true);
}