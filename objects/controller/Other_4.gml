var _rName=room_get_name(room);
global.roomTime=0;
if !visitedRoom(room) ds_list_add(global.visitedRooms,room);

//show layers
var _l=layer_get_id("bg");
if _l>-1 layer_set_visible(_l,true);
_l=layer_get_id("bg2");
if _l>-1 layer_set_visible(_l,true);

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
		}
	}
	global.devTeleport=false;
}

if instance_exists(oPlayerCam) 
{
	oPlayerCam.x=ply.x;
	oPlayerCam.y=ply.y;
	oCamera.x=oPlayerCam.x;
	oCamera.y=oPlayerCam.y;
	oCamera.xTo=oCamera.x;
	oCamera.yTo=oCamera.y;
}
with oCamera findCameraPosition(true);

//souldrop
alarm[2]=3;


//background
switch room //room specific elements
{
	case rNotdon:
		instance_create_layer(2175,600,"bg2",oReactorBG);
		var _m=instance_create_layer(588,678,"bg2",oNotdonMountains);
		_m.image_xscale=-1;
		_m.tileX=3;
		instance_create_layer(2119,744,"bg2",oNotdonMountains);
		instance_create_layer(1011,211,"bg2",oNotdonMountains);
		instance_create_layer(0,0,"bg2",oOvercast);
		var _o=instance_create_layer(0,0,"bg",oOvercast);
		_o.image_index=1;
		break;
	case rWastesNotdon:
	case rNotdonWell:
		var _b=instance_create_layer(0,0,"bg",oBackground);
		_b.sprite_index=sNotdonUnderBG;
		_b.tileX=true;
		_b.tileY=true;
		break;
	case rIsland:
		instance_create_layer(1456,-70,"bg",oIslandTreeBG);
		var _t=instance_create_layer(1231,-70,"bg",oIslandTreeBG);
		with _t
		{
			image_blend=merge_color(c_white,c_black,0.3);
			xLerp=0.65;
			yLerp=0.65;
		}
		break;
	case rAir:
		instance_create_layer(0,0,"bg2",oAirClouds);
		break;
	default: break;
}
switch room //skybox
{
	case rNotdon:
		instance_create_layer(0,0,"bg",oSkyNotdon);
		break;
	case rIsland:
		instance_create_layer(0,0,"bg",oSkyIsland);
		break;
	case rAir:
		instance_create_layer(0,0,"bg",oSkyAir);
		break;
	default: break;
}

//discord
setDiscordStatus();