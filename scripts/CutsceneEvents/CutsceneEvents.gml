	//cutscene specific scripts go here
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
		y=413
		st=0;
	}
	
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
	
	createCutsceneDelay({key:"pro_reactorSetV",delay:100,args:[],myRoom: "rNotdon"});
	
	//createCutsceneDelay({key:"pro_switchSmittenLocation",force: true,condition:"hasItem",args:["iPhoneNote3"],myRoom: "rNotdon"});
	
	//position characters
	setNPCRoom("citra","rNotdon","pro_reactor");
	setNPCRoom("eugene","rNotdon","pro_reactor");
	setNPCRoom("nora","rNotdon","pro_reactorLeft");
	setNPCRoom("smitten","rNotdon","pro_reactorLeft");
	setNPCRoom("harold","rNotdon","pro_electro");
	setNPCRoom("charlie","rNotdon","pro_reactorLeft");
	setNPCRoom("matt","rNotdon","pro_electro");
	
	setNPCRoom("smitten","rNotdon","pro_reactor");
	DEBUG_moveNPC("smitten",rNotdon,"pro_launch",60);
	
	addDroppedItem(3191,856,rNotdon,"iPhoneNote1");
	addDroppedItem(2361,772,rNotdon,"iPhoneNote2");
	addDroppedItem(1808,676,rNotdon,"iPhoneNote3");
	
	addItem("iSolitaire");
	
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
	global.startX=2236;
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

function scr_c1_1(){
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.c1;
	global.startRoom=rNotdon;
	
	destroyArray([oSouldropRainController],true);
	addData("reacSt");
	addItem("iSlate");
	if room==rNotdon roomChange(global.startX,global.startY,global.startRoom,0,0,0,1);
	save(global.lastFile);
}

function scr_c1_2(){
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.c1;
	global.startRoom=rNotdon;
	global.timeOfDay=times.day;
	global.startX=2528;
	global.startY=695;
	
	destroyArray([oSouldropRainController],true);
	setNPCRoom("charlie","rNotdonAmphitheater","c1_underStage");
	setNPCRoom("citra","rNotdon","c1_stage");
	setNPCRoom("eugene","rNotdon","c1_stage");
	setNPCRoom("nora","rNotdon","c1_stage");
	setNPCRoom("smitten","rNotdon","c1_stage");
	
	createCutsceneDelay({key:"c1_graduationTrip",condition:"plyRight",args:[2720],myRoom:"rNotdon"});
	
	addData("reacSt");
	addItem("iSlate");
	if room==rNotdon roomChange(global.startX,global.startY,global.startRoom,0,0,0,1);
	save(global.lastFile);
}

function scr_c1_3(){
	global.notdonEra=notdonEras.present;
	global.currentChapter=chapters.c1;
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
        "$eugene.setRoom",["rNotdon","c1_bay"],
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
	global.startRoom=rNotdon;
	global.timeOfDay=times.day;
	setDungeonProgress(dungeons.vr,2);
	
	setNPCRoom("smitten","rNotdon","c1_backpack");
	
	createCutsceneDelay({key:"c1_smittenBackpack",condition:"plyLeft",args:[2325],myRoom:"rNotdon"});
}