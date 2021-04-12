// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function killPlayer(){
	if ply.state!=moveState.floating
	{
		global.plyHealth=0;
		ply.state=moveState.floating;
		load(global.lastFile);
		global.dieX=ply.x;
		global.dieY=ply.y;
		global.dieRoom=room;
		global.soulButtons=[];
		var _pId=instance_nearest(x,y,ply);
		instance_deactivate_object(oSouldropCoin);
		if instance_exists(oInventory) oInventory.open=false;
		if instance_exists(oPopup) oPopup.mode=-14;
		eventRemove(oParachute,room,ply,0,"people",[]);
		if !hasData("respInt")&&!isDev //tutorial
		{
			conversation(textLoad("pro_die"));
		} 
		else
		{
			global.alive=false;
			freezeNPC();
			createSoulDoors();
			startSoulPlatforms();
			instance_create_depth(ply.x,ply.y,ply.depth,oPlayerSoul);
			//roomChange(global.plyX,global.plyY,global.nextRoom,1,0,0,1);
		}
		instance_destroy(_pId);
	}
}