/// @description Save
if !touch&&place_meeting(x,y,ply)
{
	touch=true;
	if global.alive
	{
		global.plyX=x;
		global.plyY=y;
		global.nextRoom=room;
		global.startXscale=xscale;
		global.plyHealth=global.maxHealth;
	}
	else
	{
		global.menuOpen=false;
		global.plyX=x;
		global.plyY=y;
		global.alive=true;
		global.plyHealth=global.maxHealth;
		if instance_exists(oPlayerSoul)
		{
			if !ds_map_exists(global.soulDoors,room_get_name(global.dieRoom)) ds_map_add(global.soulDoors,room_get_name(global.dieRoom),[]);
			var _arr=global.soulDoors[? room_get_name(global.dieRoom)];
			array_push(_arr,global.dieX,global.dieY,room,x,y);
			instance_destroy(oPlayerSoul);
		}
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
		instance_create_layer(x,y,"player",ply);
		ply.xscale=xscale;
		
		if hasData("reacSt") instance_activate_object(oSouldropCoin);
	}
	if !isDev save(global.lastFile);
}
else if touch&&!place_meeting(x,y,ply) touch=false;