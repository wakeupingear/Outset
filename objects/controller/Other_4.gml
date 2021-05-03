var _rName=room_get_name(room);
global.roomTime=0;

//reset effect objects
ds_list_empty(global.blurObj);
ds_list_empty(global.reflectObj);

//change music
if instance_exists(oMusicChange) instance_destroy(oMusicChange);
instance_create_depth(x,y,0,oMusicChange);

//setup camera
if (room_width==384&&room_height==216)||!instance_exists(ply)
{
	instance_create_depth(192,108,-10001,oCamera);
}
else
{
	var _pc=instance_create_depth(global.plyX,global.plyY,-10000,oPlayerCam);
	var _c=instance_create_depth(global.plyX,global.plyY,-10001,oCamera);
	//check oTransition for other stuff
	if !instance_exists(oTransition) with _c
	{
		followObj=_pc;
		followMode=1;
		setFollowTo(true);
		x=xTo;
		y=yTo;
	}
}

//set era-specific stuff
setRoomEra();
setRoomLighting(_rName);

//load npcs
createNPCs();

//create dropped items
createDroppedItems();

//set terrain
setTerrain();

//create soul doors
if !global.alive createSoulDoors();

//create persistent objects
persistentEventsSet("any");
persistentEventsSet(room);

//freeze npcs
if !global.alive&&room==global.dieRoom setFrozenNPC();

//water check
global.inWater=false;
if instance_exists(ply) with ply global.inWater=place_meeting(x,y,oWater);

//DEBUG: player position
if global.devTeleport
{
	if instance_exists(ply)
	{
		with ply
		{
			global.menuOpen=false;
			x=xstart;
			y=ystart;
			oCamera.x=x;
			oCamera.y=y;
		}
	}
	global.devTeleport=false;
}