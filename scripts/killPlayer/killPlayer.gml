// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function killPlayer(saveText){
	if !instance_exists(ply)||ply.state!=moveState.floating
	{
		if is_undefined(saveText)&&instance_exists(oTextbox) instance_destroy(oTextbox);
		global.plyHealth=0;
		load(global.lastFile);
		var _pId=-1;
		if instance_exists(ply)
		{
			ply.state=moveState.floating;
			global.dieX=ply.x;
			global.dieY=ply.y;
			_pId=instance_nearest(x,y,ply);
		}
		else
		{
			global.dieX=global.startX;
			global.dieY=global.startY;
		}
		global.dieRoom=room;
		global.soulButtons=[];
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
			if _pId!=-1 instance_create_depth(ply.x,ply.y,ply.depth,oPlayerSoul);
			//roomChange(global.plyX,global.plyY,global.nextRoom,1,0,0,1);
		}
		if _pId!=-1 instance_destroy(_pId);
	}
}