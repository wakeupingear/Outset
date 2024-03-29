	function scrVariables(){
	#region Preferences
	global.langScript=-1; //empty to load the script into
	global.buttonText="";
	global.discordText=-1;
	global.discordActive=false;
	if !isHtml&&steam_initialised() global.lang=steam_current_game_language(); //get the user's default language if possible
	global.lastFile=0; //Variables are redundent but they are a quicker and cleaner lookup for common accessibility options
	global.guiScale=0;
	setDefaultHudSize();
	
	global.hudSide=0;
	global.hudAlpha=0.8;
	global.shakeFactor=1.5;
	global.accessibility=ds_map_create();
	ds_map_add(global.accessibility,"interactPrompt",true);
	ds_map_add(global.accessibility,"lang","english");
	ds_map_add(global.accessibility,"fullscreen",false);
	ds_map_add(global.accessibility,"lastFile",global.lastFile);
	ds_map_add(global.accessibility,"guiScale",global.guiScale);
	ds_map_add(global.accessibility,"hudSide",global.hudSide);
	ds_map_add(global.accessibility,"interactText",true);
	ds_map_add(global.accessibility,"hudAlpha",global.hudAlpha);
	ds_map_add(global.accessibility,"camShake",global.shakeFactor);
	ds_map_add(global.accessibility,"vsync",(!isDev&&!isTest)||(isLinux));
	ds_map_add(global.accessibility,"blackBars",true);
	ds_map_add(global.accessibility,"flashes",true);
	ds_map_add(global.accessibility,"saveIcon",true);
	#endregion
	
	global.data =ds_map_create(); //dump misc values here
	#region Default data
	ds_map_add(global.data,"chetBP",true);
	#endregion
	#region Engine variables
	global.notPause=true; //pause menu
	global.transitioning=false; //moving between rooms
	global.menuOpen=true; //in-game menu
	global.alive=true;
	global.dieX=0;
	global.dieY=0;
	global.dieRoom=0;
	global.soulButtons=[];
	global.soulLevels=[1,2,3,4,5,6,7,8,9];
	for (var i=1;i<array_length(global.soulLevels);i++) global.soulLevels[i]+=global.soulLevels[i-1];
	global.mykoTerrain=noone;
	
	global.scanColor=c_black;
	global.scanInRangeList=ds_list_create();
	global.scanObjs=ds_list_create();
	global.scanObj=-1;
	
	global.persistentEvents=ds_map_create(); //Format: object id, 4 indexes of data
	
	global.roomTime=0;
	global.cam=-1;
	global.zoomStep=0;
	global.zoomLevel=1;
	global.zoomTo=1;
	
	global.lightSurf=-1;
	global.lightAlpha=0;
	global.lightObj=[ply,npcCitra,npcHarold,
	oSave,
	oGravityField,oLight,
	oPowerPlantTemp,
	oSouldropRain,oSouldropRainController,oSouldropCoin,
	oElevator,
	oGrapple
	];
	
	global.particleSystems=ds_list_create();
	
	global.coinColorPoint=4280556782;
	var _cp=[54,135,rVR1,1];
	addDataPair("vrcp",_cp);
	
	global.alphabet=["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", 
	"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
	"!","#","$","*"];
	
	global.npcStates={};
	
	global.pathfindingScripts=-1;
	global.grav=0.2;
	
	global.maxDamage=127;
	global.inWater=false;
	
	global.blurObj=ds_list_create();
	global.reflectObj=ds_list_create();
	#endregion
	#region Saved variables
	global.maxHealth=6;
	global.souldrop=0;
	global.level=0;
	global.lies=0;
	global.plyHealth=ceil(global.maxHealth);
	global.damageTime=60;
	global.startRoom=rCoreIntro;
	global.nextRoom=global.startRoom;
	global.startX=384+192;
	global.plyX=global.startX;
	global.startY=108+94;
	global.plyY=global.startY;
	global.hudColor=0;
	global.name="-------";
	global.startXscale=1;
	global.maxBreath=10;//30
	
	global.playtime=0;
	global.completedChapters=0;
	global.dungeonProgress="";
	for (var i=0;i<15;i++) global.dungeonProgress+="0";
	global.currentChapter=chapters.prologue;
	global.notdonEra=notdonEras.pro1;
	global.timeOfDay=times.day;
	
	addDataPair("hotel",rWastesHilltop);
	global.playerItems=ds_list_create(); //format: "iNameOfItem", number of items
	global.inventory=ds_list_create();
	global.itemSlot=0;
	global.characterLocations=ds_map_create(); //format: x,y,room,name index

	global.itemText={};
	global.droppedItems=ds_list_create(); //format: "iNameOfItem", x, y, room
	//ds_list_add(global.droppedItems,"iPlank",35,135,rTest2);
	ds_list_add(global.droppedItems,"iGrapple",192,64,rVR4);
	global.visitedRooms=ds_list_create();
	
	global.soulDoors=ds_map_create(); //format: "roomName": [dieX,dieY,endRoom,endX,endY]
	global.souldropCollect=ds_list_create(); //format: unique coin id
	
	global.distortObj=ds_list_create();
	global.distortObjAberrate=ds_list_create();
	distortModes=[global.distortObjAberrate,global.distortObj];
	
	global.scanList=ds_list_create(); //format: id
	global.scanProgress=ds_map_create(); //formate: region -> count
	for (var i=0;i<10;i++) global.scanProgress[? i]=0;
	#endregion
	
	#region Characters
	global.characters={};
	#region Character functions
	addLocation = function(_npc,_room,_key,_x,_y,_xs,_ys,_path,_varStruct){
		if is_undefined(_varStruct) _varStruct={};
		if !is_string(_room) _room=room_get_name(_room);
		if !variable_struct_exists(global.characters[$ _npc],"locations")  variable_struct_set(global.characters[$ _npc],"locations",{});
		if !variable_struct_exists(global.characters[$ _npc].locations,_room)  variable_struct_set(global.characters[$ _npc].locations,_room,{});
		global.characters[$ _npc].locations[$ _room][$ _key]={};
		global.characters[$ _npc].locations[$ _room][$ _key].startX=_x;
		global.characters[$ _npc].locations[$ _room][$ _key].startY=_y;
		global.characters[$ _npc].locations[$ _room][$ _key].xs=_xs;
		global.characters[$ _npc].locations[$ _room][$ _key].ys=_ys;
		global.characters[$ _npc].locations[$ _room][$ _key].varStruct=_varStruct;
		if !is_undefined(_path)&&_path!="" global.characters[$ _npc].locations[$ _room][$ _key].path=_path;
	}
	addLocationPathFrom = function(_npc,_from,_fromRoom,_to,_toRoom,_path,_text){
		if is_undefined(_text) _text="";
		if !is_string(_fromRoom) _fromRoom=room_get_name(_fromRoom);
		if !is_string(_toRoom) _toRoom=room_get_name(_toRoom);
		if !variable_struct_exists(global.characters[$ _npc].locations[$ _toRoom][$ _to],"pathFrom") variable_struct_set(global.characters[$ _npc].locations[$ _toRoom][$ _to],"pathFrom",{});
		if !variable_struct_exists(global.characters[$ _npc].locations[$ _toRoom][$ _to].pathFrom,_fromRoom) variable_struct_set(global.characters[$ _npc].locations[$ _toRoom][$ _to].pathFrom,_fromRoom,{});
		global.characters[$ _npc].locations[$ _toRoom][$ _to].pathFrom[$ _fromRoom][$ _from]={};
		global.characters[$ _npc].locations[$ _toRoom][$ _to].pathFrom[$ _fromRoom][$ _from].path=_path;
		if _text!="" global.characters[$ _npc].locations[$ _toRoom][$ _to].pathFrom[$ _fromRoom][$ _from].text=_text;
	}
	#endregion
	
	#region Test
	global.characters.test={
		portrait: [portTest],
		diagColor: c_nearWhite,
		font: fontSizes.medium,
	}
	addLocation("test","rTest1","t1",304,20,-1,1,"");
	addLocation("test","rTest1","t2",305,133,1,1,"test_rTest1_groundCycle");
		addLocationPathFrom("test","t1",rTest1,"t2","rTest1","test_rTest1_fromBlockToGround","testTextWalk");
	#endregion	
	#region Harold
	global.characters.harold={portrait: [portHarold],diagColor: c_nearWhite,font: fontSizes.harold,
		portIndList:["smile","neutral","sideNeutral","shifty","angry","sad","surprised"]
	};
	addLocation("harold","rTest1","t1",34,132,1,1,"");
	addLocation("harold","rNotdon","pro_electro",2183,719,1,1,""); //running the power demo
	
	addLocation("harold","rHaroldVRStart","c1_haroldVR",151,170,1,1,""); //house start
	#endregion
	#region Craig
	global.characters.craig={portrait: [portCraig],diagColor: c_nearWhite,font: fontSizes.harold,
		portIndList:["smile","neutral","sideNeutral","shifty","angry","sad","surprised"]
	};
	addLocation("craig","rTest1","t1",34,132,1,1,"");
	#endregion
	#region Citra
	global.characters.citra={portrait: [portCitra],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("citra","rNotdon","pro_lb1",1288,404,-1,1,"");
	addLocation("citra","rNotdon","pro_lb2",1205,404,-1,1,"");
		addLocationPathFrom("citra","pro_lb1","rNotdon","pro_lb2","rNotdon","simple","");
	addLocation("citra","rNotdonArchives","pro_arch1",125,179,-1,1,"simpleBackAndForth{185,179,125,179}");
		addLocationPathFrom("citra","pro_lb2","rNotdon","pro_arch1","rNotdonArchives","simpleEnterRoom{1300,404}","");
	addLocation("citra","rNotdonArchives","pro_arch2",125,179,-1,1,"simpleBackAndForth{185,179,125,179}");
	addLocation("citra","rNotdonArchives","pro_arch3",125,179,-1,1,"simpleBackAndForth{185,179,125,179}");
	addLocation("citra","rNotdon","pro_lb3",1205,404,-1,1,"");
		addLocationPathFrom("citra","pro_arch1","rNotdonArchives","pro_lb3","rNotdon","pro_citra_archiveLeave","");
		addLocationPathFrom("citra","pro_arch2","rNotdonArchives","pro_lb3","rNotdon","pro_citra_archiveLeave","");
	addLocation("citra","rNotdon","pro_electro",2129,628,1,1,"");
	addLocation("citra","rNotdon","pro_reactor",2754,732,-1,1,""); //standing next to the reactor
	
	addLocation("citra","rNotdon","c1_line",2535,692,0,1,""); //lined up
	addLocation("citra","rNotdon","c1_stage",2975,908,-1,1,""); //stage
		addLocationPathFrom("citra","c1_line","rNotdon","c1_stage","rNotdon","simpleT","");
	addLocation("citra","rNotdon","c1_bay",1557,644,-1,1,""); //launch bay
		addLocationPathFrom("citra","c1_stage","rNotdon","c1_bay","rNotdon","c1_enterLaunchBay","");
	addLocation("citra","rNotdon","c1_video",1924,452,-1,1,""); //video
		addLocationPathFrom("citra","c1_video","rNotdon","c1_bay","rNotdon","c1_enterMissionControl");
	#endregion
	#region Eugene
	global.characters.eugene={portrait: [portEugene],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("eugene","rNotdon","pro_lb1",1320,404,-1,1,""); //offscreen in intro
	addLocation("eugene","rNotdon","pro_lb2",1136,404,-1,1,""); //play area
		addLocationPathFrom("eugene","pro_lb1","rNotdon","pro_lb2","rNotdon","simple","");
	addLocation("eugene","rNotdonArchives","pro_archEnter",172,324,-1,1,"enterFade"); //enter archives
	addLocation("eugene","rNotdonArchives","pro_archGuard",231,324,-1,1,"simpleBackAndForth{256,324,213,324}"); //guard archive ladder
	addLocation("eugene","rNotdonArchives","pro_arch1",96,324,-1,1,""); //examining bench in archives
		addLocationPathFrom("eugene","pro_lb2","rNotdon","pro_arch1","rNotdonArchives","simpleEnterRoom{1300,404}");
	addLocation("eugene","rNotdon","pro_lb3",1063,403,-1,1,""); //waiting to jump
		addLocationPathFrom("eugene","pro_arch1","rNotdonArchives","pro_lb3","rNotdon","pro_eugene_archiveLeave");
	addLocation("eugene","rNotdon","pro_lb4",1063,403,-1,1,""); //waiting to jump 2
	addLocation("eugene","rNotdon","pro_lbJump",1063,403,-1,1,""); //jumping in front of citra
		addLocationPathFrom("eugene","pro_arch1","rNotdonArchives","pro_lbJump","rNotdon","simpleEnterRoom{198,330}","");
		addLocationPathFrom("eugene","pro_archGuard","rNotdonArchives","pro_lbJump","rNotdon","simpleEnterRoom{198,330}","");
	addLocation("eugene","rNotdon","pro_grotto",719,612,1,1,""); //hanging on observatory tower
		addLocationPathFrom("eugene","pro_lb4","rNotdon","pro_grotto","rNotdon","pro_eugene_cliffJump","");
		addLocationPathFrom("eugene","pro_lbJump","rNotdon","pro_grotto","rNotdon","pro_eugene_cliffJump","");
	addLocation("eugene","rNotdon","pro_electro",2128,628,1,1,""); //watching the power demo
	addLocation("eugene","rNotdon","pro_reactor",2754,772,1,1,""); //standing under the reactor
	
	addLocation("eugene","rNotdon","c1_line",2401,692,-1,1,""); //line
	addLocation("eugene","rNotdon","c1_stage",3040,772,1,1,""); //stage
		addLocationPathFrom("eugene","c1_line","rNotdon","c1_stage","rNotdon","simpleT","");
	addLocation("eugene","rNotdon","c1_bay",1645,644,1,1,""); //launch bay
		addLocationPathFrom("eugene","c1_stage","rNotdon","c1_bay","rNotdon","c1_enterLaunchBay","");
	addLocation("eugene","rNotdon","c1_video",1772,463,-1,1,""); //video
		addLocationPathFrom("eugene","c1_video","rNotdon","c1_bay","rNotdon","c1_enterMissionControl");
		
	addLocation("eugene","rWastesNotdon","wastesWait",809,177,-1,1,"jumping"); //line
		addLocationPathFrom("eugene","c1_video","rNotdon","wastesWait","rWastesNotdon","simpleT{0,0}");
	addLocation("eugene","rWastesIntro","wastes_intro",219,128,-1,1); //wastes intro
	addLocation("eugene","rWastes","wastes_crashed",2026,777,-1,1); //post-parachute
		addLocationPathFrom("eugene","wastes_intro","rWastesIntro","wastes_crashed","rWastes","simpleT{0,400}");
	#endregion
	#region Nora
	global.characters.nora={portrait: [portNora],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("nora","rNotdon","pro_lb1",1339,404,-1,1,""); //offscreen in intro
	addLocation("nora","rNotdon","pro_lb2",1155,404,-1,1,""); //play area
		addLocationPathFrom("nora","pro_lb1","rNotdon","pro_lb2","rNotdon","simple","");
	addLocation("nora","rNotdon","pro_lb3",1197,404,-1,1,""); //watching eugene jump from back of crowd
	addLocation("nora","rNotdon","pro_electro",2214,628,-1,1,""); //watching the power demo
	addLocation("nora","rNotdon","pro_reactorLeft",2244,628,1,1,""); //left of reactor
	addLocation("nora","rNotdon","pro_reactor",2691,772,1,1,""); //under reactor
		addLocationPathFrom("nora","pro_reactorLeft","rNotdon","pro_reactor","rNotdon","simpleJ","");
		
	addLocation("nora","rNotdon","c1_line",2494,692,-1,1,""); //line
	addLocation("nora","rNotdon","c1_stage",3063,908,-1,1,""); //stage
		addLocationPathFrom("nora","c1_line","rNotdon","c1_stage","rNotdon","simpleT","");
	addLocation("nora","rNotdon","c1_bay",1622,644,-1,1,""); //launch bay
		addLocationPathFrom("nora","c1_stage","rNotdon","c1_bay","rNotdon","c1_enterLaunchBay","");
	addLocation("nora","rNotdon","c1_video",1804,452,-1,1,""); //video
		addLocationPathFrom("nora","c1_video","rNotdon","c1_bay","rNotdon","c1_enterMissionControl");
		
	addLocation("nora","rAir","air_jet",1750,1168,1,1);
	addLocation("nora","rAir","air_intro",2280,1232,-1,1);
		addLocationPathFrom("nora","air_jet","rAir","air_intro","rAir","simple");
	#endregion
	#region Smitten
	global.characters.smitten={portrait: [portSmitten],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("smitten","rNotdon","pro_lb1",1358,404,-1,1,""); //offscreen in intro
	addLocation("smitten","rNotdon","pro_lb2",1174,404,1,1,""); //play area
		addLocationPathFrom("smitten","pro_lb1","rNotdon","pro_lb2","rNotdon","simple","");
	addLocation("smitten","rNotdon","pro_lb3",1160,404,-1,1,""); //watching eugene jump
	addLocation("smitten","rNotdon","pro_lb4",1270,404,-1,1,""); //blocking
		addLocationPathFrom("smitten","pro_lb3","rNotdon","pro_lb4","rNotdon","simple","");
	addLocation("smitten","rNotdon","pro_electro",2194,628,-1,1,""); //watching the power demo
	addLocation("smitten","rNotdon","pro_reactorLeft",2269,628,1,1,""); //left of reactor
	addLocation("smitten","rNotdon","pro_reactor",2715,772,1,1,""); //under reactor
		addLocationPathFrom("smitten","pro_reactorLeft","rNotdon","pro_reactor","rNotdon","simpleJ","");
	addLocation("smitten","rNotdon","pro_launch",1808,676,-1,1,""); //inside launch control
		addLocationPathFrom("smitten","pro_reactor","rNotdon","pro_launch","rNotdon","pro_smitten_launchWalk","");
	addLocation("smitten","rNotdon","pro_launchWindow",1808,644,-1,1,""); //at launch window
		addLocationPathFrom("smitten","pro_launch","rNotdon","pro_launchWindow","rNotdon","pro_smitten_toWindow","");
		
	addLocation("smitten","rNotdon","c1_line",2512,692,1,1,""); //lines
	addLocation("smitten","rNotdon","c1_stage",3022,908,-1,1,""); //stage
		addLocationPathFrom("smitten","c1_line","rNotdon","c1_stage","rNotdon","simpleT","");
	addLocation("smitten","rNotdon","c1_bay",1604,644,-1,1,""); //launch bay
		addLocationPathFrom("smitten","c1_stage","rNotdon","c1_bay","rNotdon","c1_enterLaunchBay","");
	addLocation("smitten","rNotdon","c1_backpack",2237,628,-1,1,"",{takeDamage: true, damageCutscene:"c1_smittenBackpack_hit"}); //backpack
	addLocation("smitten","rNotdon","c1_video",1829,452,1,1,""); //video
		addLocationPathFrom("smitten","c1_backpack","rNotdon","c1_video","rNotdon","simpleJ","");
		addLocationPathFrom("smitten","c1_video","rNotdon","c1_bay","rNotdon","c1_enterMissionControl");
		
	addLocation("smitten","rAir","air_jet",1750,1168,1,1);
	addLocation("smitten","rAir","air_intro",2335,1232,1,1);
		addLocationPathFrom("smitten","air_jet","rAir","air_intro","rAir","simple");
	#endregion	
	#region Charlie
	global.characters.charlie={portrait: [portCharlie],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("charlie","rNotdon","pro_lb1",1302,404,-1,1,""); //offscreen in intro
	addLocation("charlie","rNotdon","pro_lb2",1118,404,1,1,""); //play area
		addLocationPathFrom("charlie","pro_lb1","rNotdon","pro_lb2","rNotdon","simple","");
	addLocation("charlie","rNotdon","pro_lb3",1109,404,-1,1,""); //watching eugene jump
	addLocation("charlie","rNotdon","pro_lb4",1057,416,-1,1,""); //getting the parachutes
		addLocationPathFrom("charlie","pro_lb3","rNotdon","pro_lb4","rNotdon","simple","");
		addLocationPathFrom("charlie","pro_lb5","rNotdon","pro_lb4","rNotdon","simple","");
	addLocation("charlie","rNotdon","pro_lb5",1181,403,-1,1,""); //walking over to you
		addLocationPathFrom("charlie","pro_lb4","rNotdon","pro_lb5","rNotdon","pro_charlie_ledgeJump","");
	addLocation("charlie","rNotdon","pro_electro",2296,650,-1,1,""); //watching the power demo
	addLocation("charlie","rNotdon","pro_electroPanic",2296,650,-1,1,"simpleBackAndForth{2280,705,2312,650}"); //panic
	addLocation("charlie","rNotdon","pro_electroTouch",2515,725,1,1,""); //touching the reactor
		addLocationPathFrom("charlie","pro_electroPanic","rNotdon","pro_electroTouch","rNotdon","pro_charlie_reactorWalk","");
	addLocation("charlie","rNotdon","pro_reactorLeft",2160,628,1,1,""); //left of reactor
	addLocation("charlie","rNotdon","pro_reactor",2601,740,1,1,""); //close to reactor
		addLocationPathFrom("charlie","pro_reactorLeft","rNotdon","pro_reactor","rNotdon","simpleJ","");
		
	addLocation("charlie","rNotdon","c1_line",2472,692,1,1,""); //line
	addLocation("charlie","rNotdonAmphitheater","c1_underStage",258,260,1,1,""); //under stage
		addLocationPathFrom("charlie","c1_line","rNotdon","c1_underStage","rNotdonAmphitheater","simpleT","");
	addLocation("charlie","rNotdon","c1_stage",2993,908,-1,1,""); //stage
	addLocation("charlie","rNotdon","c1_bay",1672,644,-1,1,""); //launch bay
		addLocationPathFrom("charlie","c1_stage","rNotdon","c1_bay","rNotdon","c1_enterLaunchBay","");
	addLocation("charlie","rNotdon","c1_video",1887,452,1,1,""); //video
		addLocationPathFrom("charlie","c1_video","rNotdon","c1_bay","rNotdon","c1_enterMissionControl");
		
	addLocation("charlie","rWastesIntro","wastes_intro",238,128,-1,1); //wastes intro
	addLocation("charlie","rWastes","wastes_crashed",2126,777,-1,1); //post-parachute
		
	addLocation("charlie","rAir","air_jet",1742,1170,1,1);
	addLocation("charlie","rAir","air_intro",2295,1232,1,1);
		addLocationPathFrom("charlie","air_jet","rAir","air_intro","rAir","simple");
	#endregion	
	#region Matt
	global.characters.matt={portrait: [portMatt],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("matt","rNotdon","pro_electro",2246,772,1,1,""); //chilling under rocks
	#endregion
	#region Chet
	global.characters.chet={portrait: [portChet],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("chet","rNotdon","pro_search1",2137,628,1,1,""); //starting search
	
	addLocation("chet","rWastesCrater","wastes_buried",348,388,1,1,"",{takeDamage: true, damageCutscene:"wastes_chet_pulledOut"}); //buried under jet
	addLocation("chet","rWastesCrater","wastes_pulledOut",348,388,0,1,""); //pulled out of ground
		
	addLocation("chet","rAir","air_jet",1750,1168,1,1);
	addLocation("chet","rAir","air_intro",2356,1235,1,1);
		addLocationPathFrom("chet","air_jet","rAir","air_intro","rAir","simple");
	#endregion
	#region Alex
	global.characters.alex={portrait: [empty],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("alex","rNotdonAmphitheater","c1_treadmill",196,256,1,1,"c1_treadmill"); //treadmill
	#endregion 
	
	#region Her
	global.characters.her={portrait: [empty],diagColor: c_nearWhite,font: fontSizes.harold
	};
	addLocation("her",rWastesHilltop,"boxEnter",817,1033,-1,1);
	addLocation("her",rWastesHilltop,"boxWaiting",638,982,0,1);
		addLocationPathFrom("her","boxEnter",rWastesHilltop,"boxWaiting",rWastesHilltop,"wastes_herBoxes");
	addLocation("her",rWastesCrater,"treeStuck",662,385,-1,1);
		addLocationPathFrom("her","boxWaiting",rWastesHilltop,"treeStuck",rWastesCrater,"simpleJT{-100,1000}");
	#endregion
	#region Gopher
	global.characters.gopher={portrait: [empty],diagColor: c_nearWhite,font: fontSizes.harold};
	addLocation("gopher",rWastesCrater,"preFight",632,385,-1,1);
	#endregion
	#region General
	global.characters.general={portrait: [empty],diagColor: c_nearWhite,font: fontSizes.harold};
	addLocation("general",rWastesCrater,"preFight",632,385,-1,1);
	#endregion
	#region Mineral
	#endregion
	#region Ring lady
	#endregion
	
	#region Xavier
	global.characters.xavier={portrait: [portHarold],diagColor: c_nearWhite,font: fontSizes.myko,
		portIndList:["smile","neutral","sideNeutral","shifty","angry","sad","surprised"]
	};
	addLocation("xavier","rIsland","arrival",609,530,0,1,"");
	#endregion
	
	#region Babish Orange
	global.characters.babishOrange={portrait:[empty],diagColor: c_nearWhite, font: fontSizes.myko};
	addLocation("babishOrange","rCoreIntro","pro_core",477,926,1,1,""); //core start
	#endregion
	#region Craig Krisper
	global.characters.craigKrisper={portrait:[empty],diagColor: c_nearWhite, font: fontSizes.myko};
	addLocation("craigKrisper","rCoreIntro","pro_core",444,926,1,1,""); //core start
	#endregion
	
	#region Character starting data
	var _cL=variable_struct_get_names(global.characters) //add arbitray yscale, check, and nothing location to each character
	for (var i=0;i<array_length(_cL);i++)
	{
		ds_map_add(global.characterLocations,_cL[i],[0,0,-1,0,""]);
		addLocation(_cL[i],"rDevRoom","nothing",384,0,1,1,"");
		/*var _rm=room_get_name(global.characterLocations[? _cL[i]][2]);
		if global.characterLocations[? _cL[i]][4]!=""
		{
			global.characterLocations[? _cL[i]][0]=global.characters[$ _cL[i]].locations[$ _rm][$ global.characterLocations[? _cL[i]][4]].startX;
			global.characterLocations[? _cL[i]][1]=global.characters[$ _cL[i]].locations[$ _rm][$ global.characterLocations[? _cL[i]][4]].startY;
		}*/
		global.characters[$ _cL[i]].ys=1;
		global.characters[$ _cL[i]].ch=1;
	}
	
	setNPCRoom("harold",rTest1,"t1");
	setNPCRoom("craig",rTest1,"t1");
	setNPCRoom("citra",rNotdon,"pro_lb1");
	setNPCRoom("eugene",rNotdon,"pro_lb1");
	setNPCRoom("nora",rNotdon,"pro_lb1");
	setNPCRoom("smitten",rNotdon,"pro_lb1");
	setNPCRoom("charlie",rNotdon,"pro_lb1");
	hideNPC("alex");
	//setNPCRoom("alex",rNotdonAmphitheater,"c1_treadmill");
	hideNPC("general");
	setNPCRoom("xavier",rIsland,"arrival");
	setNPCRoom("babishOrange",rCoreIntro,"pro_core");
	setNPCRoom("craigKrisper",rCoreIntro,"pro_core");
	global.characterNames=[];
	#endregion
	#endregion
	
	#region Music
	global.music=-1;
	global.accessibility[? "musicVol"]=0.5*(isFinal);
	global.accessibility[? "sfxVol"]=0.8*(option("musicVol")+0.5);
	global.regionMusic=[musIntro,musNotdon,musWastes,musAir,-1,-1,-1,-1,-1,-1];
	#endregion
	
	#region Items
	global.itemData=ds_map_create();
	ds_map_add(global.itemData,"iGrapple",{
		index: 0,
		viewable: false
		//itemName : loads in setText
		//flavortext : loads in setText
	});
	setItemData=function(_name,_index,_viewable){
		ds_map_add(global.itemData,_name,{index: _index, viewable: _viewable});
	}
	setItemData("iGrappleSwing",0,false);
	setItemData("iGrappleArc",0,false);
	setItemData("iGrappleDown",0,false);
	setItemData("iGrappleAir",0,false);
	setItemData("iSlate",2,false);
	setItemData("iBackpack",2,false);
	setItemData("iLadder",7,true);
	setItemData("iPlank",1,true);
	setItemData("iPhoneNote1",2,true);
	setItemData("iPhoneNote2",2,true);
	setItemData("iPhoneNote3",2,true);
	for (var i=1;i<sprite_get_number(sArchivesWrenchesPopup);i++) setItemData("iWrench"+string(i),3,true);
	setItemData("iRocketBook",5,true);
	setItemData("iSolitaire",6,true);
	setItemData("iLavaSwitch",8,true);
	setItemData("iFormula",9,true);
	setItemData("iBeacon",11,true);
	setItemData("iRing1",12,true);
	setItemData("iRing2",13,true);
	setItemData("iRing3",14,true);
	setItemData("iJet1",15,true);
	setItemData("iJet2",16,true);
	setItemData("iJet2",17,true);
	setItemData("iCarPoster",18,true);
	setItemData("iEgg",19,true);
	#endregion
	
	#region Room functions
	global.regions=-1; //loads in setText
	global.rooms={}
	addRoomCamera=function(roomName,left,top,right,bottom,xPos,yPos,condition){
		if is_undefined(condition) condition=-1;
		array_push(global.rooms[$ roomName].camera,[left,top,right,bottom,xPos,yPos,condition]);
		if instance_exists(oCamera) with oCamera positions=global.rooms[$ room_get_name(room)].camera;
	}
	addSoulCamera=function(roomName,left,top,right,bottom,xPos,yPos,condition){
		if is_undefined(condition) condition=-1;
		array_push(global.rooms[$ roomName].soulCamera,[left,top,right,bottom,xPos,yPos,condition]);
		if instance_exists(oCamera) with oCamera soulPositions=global.rooms[$ room_get_name(room)].camera;
	}
	addBothCamera=function(roomName,left,top,right,bottom,xPos,yPos,condition){
		if is_undefined(condition) condition=-1;
		array_push(global.rooms[$ roomName].camera,[left,top,right,bottom,xPos,yPos,condition]);
		array_push(global.rooms[$ roomName].soulCamera,[left,top,right,bottom,xPos,yPos,condition]);
	}
	removeCamera=function(roomName,xPos,yPos){
		for (var i=0;i+5<array_length(global.rooms[$ roomName].camera);i+=6){
			if global.rooms[$ roomName].camera[4]==xPos&&global.rooms[$ roomName].camera[5]==yPos {
				break;
			}
		}
	}
	if !isHtml&&file_exists("rooms.hat") global.rooms=loadStringJson("rooms"); //precalculate the room data
	else {
	for (var i=0;room_exists(i);i++) //if i!=rStartup 
	{
		var _name=room_get_name(i);
		var _ln=string_lower(_name);
		var _reg=worldRegion.notdon;
		if i==rTitle _reg=worldRegion.title;
		else if string_pos("wastes",_ln)>0||string_pos("titan",_ln)>0 _reg=worldRegion.west;
		else if string_pos("air",_ln)>0 _reg=worldRegion.air;
		else if string_pos("breadnought",_ln)>0 _reg=worldRegion.breadnought;
		else if string_pos("deep",_ln)>0 _reg=worldRegion.deeptown;
		else if string_pos("isla",_ln)>0 _reg=worldRegion.east;
		else if string_pos("core",_ln)>0 _reg=worldRegion.core;
		else if string_pos("dev",_ln)>0||string_pos("test",_ln)>0 _reg=worldRegion.testing;
		else if string_pos("vr",_ln)>0 _reg=worldRegion.vr;
		global.rooms[$ _name] ={
			region: _reg,
			inside: true,
			music: global.regionMusic[_reg],
			name: "???", //loads in setText
			camera: [],
			soulCamera:[]
			//npcs: []
		};
	}
	#endregion
	#region Specific rooms
	global.rooms.rStartup.region=worldRegion.testing;
	global.rooms.rTitle.darkness=0;
	global.rooms.rTitle.musicLoop=false;
	global.rooms.rCoreIntro.music=musWindWobble;
	//global.rooms.rTest1.npcs=[npcTest,npcHarold];
		addRoomCamera("rCoreIntro",576-192,980-192,576+192,980+192,576,980); //center
	global.rooms.rNotdon.inside=false;
		addRoomCamera("rNotdon",1562,0,1778,546,1620,468); //bounce pad
		addRoomCamera("rNotdon",2216,698,2562,2000,2374,798,"notdonEraPastPro3"); //the nook
		addRoomCamera("rNotdon",1092,262,1496,459,"x",378); //outside archives
		addRoomCamera("rNotdon",1786,556,1920,768,1760,"y","notdonEraLaunchExists"); //mission control
		addSoulCamera("rNotdon",928-172,398-148,1052,398+108,914,398); //cliffside
		addSoulCamera("rNotdon",3444,1148,5000,1336,"x",1294); //pier
		addRoomCamera("rNotdon",1254,530,1782,660,"x",598); //launch level 1
		addRoomCamera("rNotdon",1254,660,1782,842,"x",748); //launch level 2
		addRoomCamera("rNotdon",2822,756,3168,970,2995,888,"notdonEraPresent"); //stage
	global.rooms.rVRUnfinished.inside=false;
		addRoomCamera("rVRUnfinished",956,0,1156,216,960,108); //end of VR chase
	global.rooms.rHarold.music=musHarold;
	global.rooms.rWastes.inside=false;
		addRoomCamera("rWastes",2020,720,2150,1000,2047,828); //starting building
	global.rooms.rWastesBorder.inside=false;
	global.rooms.rWastesCrater.inside=false;
	global.rooms.rWastesHilltop.inside=false;
	global.rooms.rWastesFactoryOutside.inside=false;
		addRoomCamera("rWastesFactory1",436,684,768,760,384,756);
		addRoomCamera("rWastesFactoryWorkers",-200,-400,800,174,"x",108);
		addRoomCamera("rWastesFactoryWorkers",-200,174,370,1000,192,270);
	//global.rooms.rNotdonArchives.npcs=[npcEugene,npcCitra];
		addRoomCamera("rNotdonAdults",384,216,768,432,576,324);
		addBothCamera("rWastesNotdon",762,-20,1251,212,963,108); //wastes transition tunnel
		addBothCamera("rNotdonArchives",0,0,384,210,192,108); //citra office
	
		addRoomCamera("rWastesHilltop",934,696,1070,1300,996,743); //Garage
		addRoomCamera("rWastesFactoryOutside",0,0,500,250,320,160); //factory crane
	
	global.rooms.rIsland.inside=false;
	}
	#endregion
	
	#region UI
	global.guiSurf=-1;
	global.interactText=-1;
	global.interactTextObj=noone;
	global.interactTextLabels=[]; //loads in setText
	global.fonts=[
	[], //720
	[small1440,med1080,large1440,extralarge1440,harold1440], //1080
	[small1440,med1440,large1440,extralarge1440,harold1440], //1440
	[] //2160
	];
	setHudSize();
	global.hudColorList=[make_color_rgb(96,92,169  )]; //possible colors for the hud
	#endregion
	
	#region Controller
	global.controllerConnected=false;
	global.controllerSlot=-1;
	global.controllerType=-1;
	
	enum control {
		up,
		down,
		left,
		right,
		jump,
		select,
		start,
		grapple,
		item,
		swapLeft,
		swapRight,
		confirm,
		swing,
		fullscreen,
		noclip,
		skipDialogue
	}
	
	global.controllerInputs=ds_list_create();
	ds_list_add(global.controllerInputs,
	[gp_padu,leftStickUp], //up
	[gp_padd,leftStickDown], //down
	[gp_padl,leftStickLeft], //left
	[gp_padr,leftStickRight], //right
	[gp_face1], //jump
	[gp_select], //menu
	[gp_start], //pause
	[gp_face3,gp_shoulderrb], //grapple 1
	[gp_face4], //item
	[gp_shoulderl], //left swap
	[gp_shoulderr], //right swap
	[gp_face2], //confirm
	[gp_shoulderlb], //grapple 2
	[], //fullscreen
	[gp_stickr], //debug
	[] //skip dialogue
	);
	global.keyboardInputs=ds_list_create();
	ds_list_add(global.keyboardInputs,
	[vk_up,ord("W")], //up
	[vk_down,ord("S")], //down
	[vk_left,ord("A")], //left
	[vk_right,ord("D")], //right
	[vk_space,ord("J")], //jump
	[vk_tab], //menu
	[vk_escape], //pause
	[vk_lshift,vk_rshift,ord("L")], //grapple
	[ord("I")], //item
	[ord("Q"),ord("U")], //left swap
	[ord("E"),ord("O")], //right swap
	[vk_enter,ord("K")], //confirm
	[vk_control,ord("H")], //grapple 2
	[vk_insert,vk_f4], //fullscreen
	[ord("T")], //debug
	[vk_alt] //skip dialogue
	);
	
	global.numOfInputs=ds_list_size(global.keyboardInputs);
	global.inputs=array_create(global.numOfInputs); //filled in inputForPlayer1
	global.lastInputs=array_create(global.numOfInputs); //filled in inputForPlayer1
	global.doubleInput=array_create(global.numOfInputs);
	global.doubleInputTime=array_create(global.numOfInputs);
	for (var i=0;i<global.numOfInputs;i++) switch i
	{
		default:
			global.doubleInputTime[i]=20;
			break;
	}
	#endregion
	
	#region Dev tools
	global.devSkips=false;
	global.devTeleport=false;
	global.startRoom=rCoreIntro;
	if isDev
	{
		global.devTeleport=true;
		global.devSkips=true;
		global.startRoom=rWastesRocketStand;
		ds_list_add(global.playerItems,"iGrapple",1,"iGrappleSwing",1,"iGrappleDown",1,"iGrappleArc",1);
	}
	else if isTest
	{
		addData("reacSt");
		addData("respInt");
		global.devTeleport=true;
		global.devSkips=true;
		//addItem("iGrapple");
		//addItem("iGrappleArc");
		//addItem("iGrappleDown");
		addItem("iSlate");
		addItem("iSolitaire");
		//addItem("iBeacon");
		//addItem("iWrench1");
		//addItem("iFormula");
		//addItem("iLavaSwitch");
		//global.notdonEra=notdonEras.present;
		//scr_pro_2();
		//scr_c1_5();
		//scr_c1_6();
		//scr_air_1();
		scr_air_2();
		//scr_wastes_3()
		//scr_air_1();
		//scr_wastes_1();
		//scr_wastes_2();
		//scr_wastes_1();
		//scr_wastes_2();
		//scr_pro_2();
		//addData("factoryPower");
		/*createCutsceneDelay({
			key:"c1_5",
			myRoom:"rNotdon",
			delay:4
		});*/
			//scr_island_1();
			global.startRoom=rWastesCrater;
	}
	#endregion
	
	#region NPC sprite mask data
	global.physCollPoints=ds_map_create();
	ds_map_add(global.physCollPoints,sPly,[[-3,2,-3,2,-3,2,-3,2],[8,8,4,4,0,0,6,6]]);
	ds_map_add(global.physCollPoints,sPlySprite,global.physCollPoints[? sPly]);
	ds_map_add(global.physCollPoints,sTestPersonBig,[[-3,2,0],[8,8,-8]]);
	ds_map_add(global.physCollPoints,sTestPersonHarold,[[-8,7,-1],[11,11,-8]]);
	ds_map_add(global.physCollPoints,sGrapple,[[-3,3,-3,3,0],[-3,3,-3,3,0]]);
	ds_map_add(global.physCollPoints,sPlaceholderBounce,[[-12,12],[4,4]]);
	ds_map_add(global.physCollPoints,sPlaceholderBounceAngle,[[-12,12],[11,11]]);
	
	ds_map_add(global.physCollPoints,sJoe,[[-16,16],[32,32]]);
	ds_map_add(global.physCollPoints,sBotBuster,[[-7,7],[8,8]]);
	ds_map_add(global.physCollPoints,sGreemer,[[-10,6,0],[2,2,-12]]);
	ds_map_add(global.physCollPoints,sVRRobot,[[0],[22]]);
	ds_map_add(global.physCollPoints,sDragami,[[-14,8,-14,8],[2,2,-25,-25]]);
	ds_map_add(global.physCollPoints,sTurretSmall,[[0],[6]]);
	ds_map_add(global.physCollPoints,sAAGun,[[0],[7]]);
	ds_map_add(global.physCollPoints,sExplosiveBarrel,[[0],[9]]);
	
	ds_map_add(global.physCollPoints,sHer,global.physCollPoints[? sPly]);
	ds_map_add(global.physCollPoints,sChet,[[0],[4]]);
	
	ds_map_add(global.physCollPoints,sWastesCarWheel,[[-7,0,7],[0,7,0]]);
	ds_map_add(global.physCollPoints,sWastesCrate,[[-12,12],[15,15]]);
	ds_map_add(global.physCollPoints,sWastesCrateStand,global.physCollPoints[? sWastesCrate]);
	ds_map_add(global.physCollPoints,sWastesCrateBig,[[-29,29],[31,31]]);
	#endregion
}