

function killPlayer(saveText){
	if !instance_exists(ply)||ply.state!=moveState.floating
	{
		if global.rooms[$ room_get_name(room)].region==worldRegion.vr
		{
			var _cp=hasData("vrcp");
			global.plyHealth=global.maxHealth;
			shake(2,2,10);
			roomChange(_cp[0],_cp[1],_cp[2],transitions.whiteSudden,0,0,_cp[3]);
		}
		else
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
			if instance_exists(oSouldropCoin) instance_deactivate_object(oSouldropCoin);
			if instance_exists(oInventory) oInventory.open=false;
			if instance_exists(oPopup) oPopup.exiting=true;
			global.menuOpen=false;
			eventRemove(oParachute,room,ply,0,"people",[]);
			if !hasData("respInt")&&!isDev //tutorial
			{
				shake(3,3,25);
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
			if _pId!=-1 
			{
				destroyArray([_pId,oGrapple,oGrapplePoint]);
				instance_create_depth(x,y,depth-1,oGrapple);
			}
		}
	}
}