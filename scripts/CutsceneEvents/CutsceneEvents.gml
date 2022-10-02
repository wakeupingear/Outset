//cutscene specific scripts go here	
#region Prologue
function scr_pro_2(){
	addData("respInt");
	global.notdonEra=notdonEras.pro2;
	global.startX=1772;
	global.startY=455;
	global.plyX=global.startX;
	global.plyY=global.startY;
	global.startRoom=rNotdon;
	global.menuOpen=false;
	global.timeOfDay=times.night;
	setRoomLighting(room_get_name(room));
	
	//destroy all old objects
	destroyArray([oMissile],false);
	destroyArray([oVShip,oVBarrier,oExplosion,npc,oTextbox]);
	
	var _str={key:"pro_electroTest",condition:"plyRight",args:[2082],myRoom: "rNotdon"};
	createCutsceneDelay(_str);
	//position characters
	setNPCRoom("citra","rNotdon","pro_electro");
	setNPCRoom("eugene","rNotdon","pro_electro");
	setNPCRoom("nora","rNotdon","pro_electro");
	setNPCRoom("smitten","rNotdon","pro_electro");
	setNPCRoom("harold","rNotdon","pro_electro");
	setNPCRoom("charlie","rNotdon","pro_electro");
	setNPCRoom("matt","rNotdon","pro_electro");
	
	with controller
	{
		setRoomEra(); //reload npcs and era layers
		createNPCs();
		setTerrain();
	}
	
	//rNotdon specific stuff
	if instance_exists(oBounceAngle) with oBounceAngle if x>1480&&x<1600
	{
		y=413;
		st=0;
	}
	if instance_exists(oSkyNotdon) oSkyNotdon.vShipTime=0;
	
	save(global.lastFile);
}

function scr_pro_3(){
	global.notdonEra=notdonEras.pro3;
	global.startX=2574;
	global.startY=719;
	global.plyX=global.startX;
	global.plyY=global.startY;
	global.startRoom=rNotdon;
	global.menuOpen=false;
	global.timeOfDay=times.day;
	setRoomLighting(room_get_name(room));
	
	//destroy all old objects
	destroyArray([oMissile],false);
	destroyArray([oVShip,oVBarrier,oExplosion,npc,oTextbox]);
	
	//dev - ignore
	//createCutsceneDelay({key:"pro_reactorSetV",delay:100,args:[],myRoom: "rNotdon"});
	
	createCutsceneDelay({key:"pro_switchSmittenLocation",force: true,condition:"hasItem",args:["iPhoneNote3"],myRoom: "rNotdon"});
	
	//position characters
	setNPCRoom("citra","rNotdon","pro_reactor");
	setNPCRoom("eugene","rNotdon","pro_reactor");
	setNPCRoom("nora","rNotdon","pro_reactorLeft");
	setNPCRoom("smitten","rNotdon","pro_reactorLeft");
	setNPCRoom("harold","rNotdon","pro_electro");
	setNPCRoom("charlie","rNotdon","pro_reactorLeft");
	setNPCRoom("matt","rNotdon","pro_electro");
	
	setNPCRoom("smitten","rNotdon","pro_reactor");
	//DEBUG_moveNPC("smitten",rNotdon,"pro_launch",60);
	
	addDroppedItem(3191,856,rNotdon,"iPhoneNote1");
	addDroppedItem(2361,772,rNotdon,"iPhoneNote2");
	addDroppedItem(1808,676,rNotdon,"iPhoneNote3");
	
	addDataPair("toiletTime",global.roomTime);
	
	with controller
	{
		setRoomEra(); //reload npcs and era layers
		createNPCs();
		createDroppedItems();
		setTerrain();
	}
	
	save(global.lastFile);
}

function scr_pro_4(){	
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.prologue;
	global.startX=3236;
	global.startY=1311;
	global.plyX=global.startX;
	global.plyY=global.startY;
	if instance_exists(ply)
	{
		ply.x=global.startX;
		ply.y=global.startY;
	}
	killPlayer(true);
	global.startRoom=rNotdon;
	global.menuOpen=false;
	global.timeOfDay=times.night;
	setRoomLighting(room_get_name(room));
	
	//swap items
	var _items=["iPhoneNote1","iPhoneNote3","iPhoneNote2"];
	for (var i=0;i<array_length(_items);i++)
	{
		if hasItem(_items[i])
		{
			removeItem(_items[i]);
			//add to chest
		}
		else
		{
			removeDroppedItemName(_items[i]);
		}
	}
	
	//destroy all old objects
	destroyArray([oMissile],false);
	destroyArray([oVShip,oVBarrier,oExplosion,npc,oReactorBeam,oReactorBeamBG]);
	
	createCutsceneDelay({key:"pro_reactorRespawn",condition:"alive",myRoom: "rNotdon"});
	
	with controller
	{
		setRoomEra(); //reload npcs and era layers
		createNPCs();
		createDroppedItems();
		setTerrain();
	}
	save(global.lastFile);
}
#endregion

#region Chapter 1
function scr_c1_1(){
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.c1;
	global.completedChapters=1;
	global.startRoom=rNotdon;
	global.timeOfDay=times.day;
	global.startX=2454;
	global.startY=695;
	
	setNPCRoom("citra","rNotdon","c1_line");
	setNPCRoom("eugene","rNotdon","c1_line");
	setNPCRoom("charlie","rNotdon","c1_line");
	setNPCRoom("nora","rNotdon","c1_line");
	setNPCRoom("smitten","rNotdon","c1_line");
	
	destroyArray([oSouldropRainController],true);
	addData("reacSt");
	addItem("iSlate");
	if room==rNotdon roomChange(global.startX,global.startY,global.startRoom,0,0,0,1);
	save(global.lastFile);
}

function scr_c1_2(){
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.c1;
	global.completedChapters=1;
	global.startRoom=rNotdon;
	global.timeOfDay=times.day;
	global.startX=2454;
	global.startY=695;
	
	destroyArray([oSouldropRainController],true);
	setNPCRoom("charlie","rNotdonAmphitheater","c1_underStage");
	setNPCRoom("citra","rNotdon","c1_stage");
	setNPCRoom("eugene","rNotdon","c1_stage");
	setNPCRoom("nora","rNotdon","c1_stage");
	setNPCRoom("smitten","rNotdon","c1_stage");
	
	createCutsceneDelay({key:"c1_graduationSpeech",condition:"plyRight",args:[2820],myRoom:"rNotdon"});
	createCutsceneDelay({key:"c1_graduationTrip",condition:"plyRight",args:[2720],myRoom:"rNotdon"});
	
	addData("reacSt");
	addItem("iSlate");
	save(global.lastFile);
}

function scr_c1_3(){
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.c1;
	global.completedChapters=1;
	global.startRoom=rNotdon;
	global.timeOfDay=times.day;
	if npcGetRoom("charlie")=="rNotdon.c1_stage" setNPCRoom("charlie","rNotdonAmphitheater","c1_underStage");
	else setNPCRoom("charlie","rNotdonAmphitheater","c1_underStage");
	setNPCRoom("citra","rNotdon","c1_bay");
	setNPCRoom("eugene","rNotdon","c1_bay");
	setNPCRoom("nora","rNotdon","c1_bay");
	setNPCRoom("smitten","rNotdon","c1_bay");
	setNPCRoom("harold","rHaroldVRStart","c1_haroldVR");
	
	createCutsceneDelay({key:"c1_vStart",condition:"plyLeft",myRoom: "rNotdon",args:[2008]});
	createCutsceneDelay({key:"c1_haroldIntro",myRoom: "rHaroldVRStart"});
	/*
	"$citra.setRoom",["rNotdon","c1_bay"],
        "$nora.setRoom",["rNotdon","c1_bay"],
        "$eugene.setRoom",["rNotdon","c1_baya"],
        "$smitten.setRoom",["rNotdon","c1_bay"],
        "$if1","charlie.getRoom",["rNotdon.c1_stage"],
            "#true1",
                "$charlie.setRoomTeleport",["rNotdon","c1_bay"],
                "$goto","trip",
            "#false1",
                "charlie go brrr",
        "#trip",
        "$cutsceneDelay",{"delay":180,"key":"c1_shoeTrip"},
        "$cutsceneCondition",{"key":"c1_vStart","condition":"plyLeft","args":[2008]*/
}

function scr_c1_4(){
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.c1;
	global.completedChapters=1;
	global.startRoom=rNotdon;
	global.timeOfDay=times.day;
	setDungeonProgress(dungeons.vr,2);
	
	setNPCRoom("smitten","rNotdon","c1_backpack");
	
	setNPCRoom("citra","rNotdon","c1_video");
	setNPCRoom("charlie","rNotdon","c1_video");
	setNPCRoom("nora","rNotdon","c1_video");
	setNPCRoom("eugene","rNotdon","c1_video");
	
	eventRemove(oVShip,rNotdon,1582,408,"bg2",[]);
	
	createCutsceneDelay({key:"c1_smittenBackpack",condition:"plyLeft",args:[2325],myRoom:"rNotdon"});
	createCutsceneDelay({key:"c1_groupForgetName",condition:"plyLeft",args:[1964],myRoom:"rNotdon"});
}

function scr_c1_5(){
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.c1;
	global.completedChapters=1;
	global.startRoom=rNotdon;
	global.timeOfDay=times.day;
	global.plyX=1837;
	global.plyY=711;
	addData("notdonPowerless");
	setRoomLighting(room_get_name(room));
	setDungeonProgress(dungeons.vr,2);
	var _jet1=instance_create_layer(1627,613,"behind",oNotdonJet);
	var _jet2=instance_create_layer(1376,613,"behind",oNotdonJet);
	_jet2.state=-1;
	var _jet3=instance_create_layer(1627,709,"behind",oNotdonJet);
	_jet3.state=-2;
	oNotdonJet.image_xscale=1;
	with oNotdonJet 
	{
		setState();
		if room==rStartup event_perform(ev_alarm,0);
	}
	
	instance_create_depth(1474,357,layer_get_depth(layer_get_name("hitPresent")),oNotdonPowerLadder);
	if instance_exists(oPlatformButton) with oPlatformButton hasPower=roomHasPower();
	setNPCRoom("smitten","rNotdon","c1_bay");
	setNPCRoom("citra","rNotdon","c1_bay");
	setNPCRoom("eugene","rNotdon","c1_bay");
	setNPCRoom("nora","rNotdon","c1_bay");
	setNPCRoom("smitten","rNotdon","c1_bay");
}

function scr_c1_6(){
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.c1;
	global.completedChapters=1;
	global.startRoom=rNotdon;
	
	timeOfDay=times.day;
	
	var _jet=-1;
	with oNotdonJet if state==0 _jet=id;
	if _jet==-1 var _jet=instance_create_layer(0,0,"behind",oNotdonJet);
	with _jet
	{
		image_xscale=-1;
		flying=true;
		seethroughOverride=-1;
		cockpitCheck.key="notdon_jetWaiting";
		chairData[0][0]=2;
		chairData[0][1]="c1_chetUnderChair";
		chairData[1][0]=2;
		chairData[2][0]=2;
		chairData[3][0]=2;
		chairData[5][0]=2;
		sitMode="c1_jetBoarded";
	}
	
	if ply.x<1444 with _jet switchRoom(461,1262,rNotdon,true,false);
	else with _jet switchRoom(3562,1277,rNotdon,true,false);
	with _jet
	{
		y-=400;
		lastYTo=y;
	}
	
	hideNPC("smitten");
	hideNPC("citra");
	hideNPC("eugene");
	hideNPC("nora");
	hideNPC("smitten");
}
#endregion

#region Wastes
function scr_wastes_1(){ //leaving
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.wastes;
	global.startRoom=rAir;
	global.timeOfDay=times.day;
	global.startX=2122;
	global.startY=1442;
	
	eventAddObject(oDiagTrigger,rWastes,400,939,"player",["wastes_barrelRoll",true,false,1,-100,-150]);
	
	var _jet=-1;
	if !instance_exists(oNotdonJet) _jet=instance_create_layer(0,0,"behind",oNotdonJet);
	else with oNotdonJet if state==0&&flying _jet=id;
	with _jet 
	{
		image_xscale=-1;
		flying=false;
		seethroughOverride=0;
		plyRiding=false;
		cockpitCheck.key="notdon_jetEmpty";
		sitMode="";
		startAng=17;
		state=1; //fire
		switchRoom(226,359,rWastesCrater,false,false);
		if room=rNotdon
		{
			plyRiding=hasData("ditch1");
			image_xscale=-1;
			flying=true;
			maxSpd=5;
			state=0;
			if x<1245 moveCommand="c1_toWastesLeft";
			else moveCommand="c1_toWastesRight";
		}
	}
}

function scr_wastes_2(){ //crash land
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.wastes;
	global.startRoom=rWastes;
	global.timeOfDay=times.day;
	global.startX=1949;
	global.startY=919;
	
	setNPCRoom("chet",rWastesCrater,"wastes_buried");
}

function scr_wastes_3(){ //defeat general
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.wastes;
	global.startRoom=rWastesCrater;
	global.timeOfDay=times.day;
	global.startX=513;
	global.startY=372;
	global.startXscale=-1;
	
	with oGeneralBoss destroyObjects();
	with oWastesWarehouse {
		while place_meeting(x,y,oWastesCrate) instance_destroy(instance_place(x,y,oWastesCrate));
	}
	
	addDataPair("wWare",4);
	if instance_exists(oWastesWarehouse) with oWastesWarehouse event_perform(ev_alarm,1);
	var _h=instance_create_layer(-2,-238,"behind",oTerrainEvent);
	_h.sprite_index=sWastesCraterTerrain;
	_h.image_index=1;
	_h.startroom=rWastesCrater;
}
#endregion

#region Air
function scr_air_1(){
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.air;
	global.startRoom=rAir;
	global.timeOfDay=times.day;
	global.startX=2262;
	global.startY=2220;
	global.devTeleport=false;
	
	createCutsceneDelay({key:"air_intro1",myRoom: "rAir"});
	
	var _jet=-1;
	if !instance_exists(oNotdonJet) var _jet=instance_create_layer(0,0,"behind",oNotdonJet);
	else with oNotdonJet if state==0&&flying _jet=id;
	with _jet 
	{
		image_xscale=1;
		flying=true;
		seethroughOverride=1;
		plyRiding=true;
		cockpitCheck.key="notdon_jetEmpty";
		sitMode="";
		switchRoom(2300,2226,rAir,false,false);
		if room=rNotdon
		{
			plyRiding=hasData("ditch1");
			image_xscale=-1;
			flying=true;
			maxSpd=5;
			if x<1245 moveCommand="c1_toAirLeft";
			else moveCommand="c1_toAirRight";
		}
	}
}
function scr_air_2(){
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.air;
	global.startRoom=rAir;
	global.timeOfDay=times.day;
	global.startX=1949;
	global.startY=1142;
	
	setNPCRoom("charlie",rAir,"air_jet");
	setNPCRoom("chet",rAir,"air_intro");
	setNPCRoom("nora",rAir,"air_intro");
	setNPCRoom("smitten",rAir,"air_intro");
	
	createCutsceneDelay({key:"air_intro2",myRoom: "rAir",condition: "plyRight", args: [2297]});
	
	if !instance_exists(oNotdonJet) var _jet=instance_create_layer(0,0,"behind",oNotdonJet);
	else with oNotdonJet if state==0 _jet=id;
	with _jet 
	{
		image_xscale=1;
		flying=false;
		
		seethroughOverride=0;
		plyRiding=false;
		cockpitCheck.key="notdon_jetEmpty";
		sitMode="";
		switchRoom(1782,1171,rAir,false,false);
	}
}
#endregion

#region Deep
function scr_deep_1(){
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.island;
	global.startRoom=rIsland;
	global.timeOfDay=times.day;
	global.startX=430;
	global.startY=611;
}
#endregion

#region Island
function scr_island_1(){
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.island;
	global.startRoom=rIsland;
	global.timeOfDay=times.day;
	global.startX=430;
	global.startY=611;
	
	var _jet=-1;
	if !instance_exists(oNotdonJet) var _jet=instance_create_layer(0,0,"behind",oNotdonJet);
	else with oNotdonJet if state==0&&flying _jet=id;
	with _jet 
	{
		image_xscale=1;
		flying=false;
		seethroughOverride=0;
		plyRiding=false
		cockpitCheck.key="notdon_jetEmpty";
		sitMode="";
		switchRoom(222,580,rIsland,false,false);
		if room=rNotdon
		{
			plyRiding=hasData("ditch1");
			image_xscale=-1;
			flying=true;
			maxSpd=5;
			if x<1245 moveCommand="c1_toIslandRight";
			else moveCommand="c1_toIslandLeft";
		}
	}
	createCutsceneDelay({key:"island_xavierIntro",condition:"plyRight",args:[564],myRoom:"rIsland"});
}
#endregion