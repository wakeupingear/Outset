

function scrVariables(){
	//preferences
	global.lang="english"; //language
	global.langScript=-1; //empty to load the script into
	global.buttonText="";
	if !isHtml&&steam_initialised() global.lang=steam_current_game_language(); //get the user's default language if possible
	global.lastFile=0;
	global.musicVol=0.5*(!isDev&&!isTest);
	global.sfxVol=0.8;
	global.guiScale=clamp(round(3*display_get_height()/1080),3,6)/3;
	global.hudSide=0;
	global.hudAlpha=0.8;
	global.accessibility=ds_list_create();
	ds_list_add(global.accessibility,"shake","interactPrompt");
	
	global.notPause=true; //pause menu
	global.transitioning=false; //moving between rooms
	global.menuOpen=true; //in-game menu
	global.alive=true;
	global.dieX=0;
	global.dieY=0;
	global.dieRoom=0;
	global.soulButtons=[];
	
	global.scanColor=c_black;
	global.scanInRangeList=ds_list_create();
	global.scanObjs=ds_list_create();
	global.scanObj=-1;
	
	//saved files
	global.maxHealth=6;
	global.souldrop=0;
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
	global.name="Big Chungus";
	global.startXscale=1;
	global.maxBreath=10;//30
	
	global.playtime=0;
	global.completedChapters=0;
	global.dungeonProgress="";
	for (var i=0;i<15;i++) global.dungeonProgress+="0";
	global.currentChapter=chapters.prologue;
	global.notdonEra=notdonEras.pro1;
	global.timeOfDay=times.day;
	
	global.data =ds_list_create(); //dump misc values here
	global.playerItems=ds_list_create(); //format: "iNameOfItem", number of items
	global.inventory=ds_list_create();
	global.itemSlot=0;
	global.characterLocations=ds_map_create(); //format: x,y,room,name index
	ds_map_add(global.characterLocations,"test",[304,20,rTest1,0,"t1"]);
	ds_map_add(global.characterLocations,"harold",[34,132,rTest1,2,"t1"]);
	ds_map_add(global.characterLocations,"citra",[0,0,rNotdon,4,"pro_lb1"]);
	ds_map_add(global.characterLocations,"eugene",[0,0,rNotdon,5,"pro_lb1"]);
	ds_map_add(global.characterLocations,"nora",[0,0,rNotdon,6,"pro_lb1"]);
	ds_map_add(global.characterLocations,"smitten",[0,0,rNotdon,7,"pro_lb1"]);
	ds_map_add(global.characterLocations,"charlie",[0,0,rNotdon,8,"pro_lb1"]);
	ds_map_add(global.characterLocations,"matt",[0,0,-1,9,""]);
	ds_map_add(global.characterLocations,"chet",[0,0,-1,10,""]);
	ds_map_add(global.characterLocations,"alex",[0,0,rNotdonAmphitheater,10,"c1_treadmill"]);

	ds_map_add(global.characterLocations,"babishOrange",[477,926,rCoreIntro,3,"pro_core"]);
	ds_map_add(global.characterLocations,"craigKrisper",[444,926,rCoreIntro,3,"pro_core"]);

	global.itemText={};
	global.droppedItems=ds_list_create(); //format: "iNameOfItem", x, y, room
	//ds_list_add(global.droppedItems,"iPlank",35,135,rTest2);
	global.visitedRooms=ds_list_create();
	
	global.soulDoors=ds_map_create(); //format: "roomName": [dieX,dieY,endRoom,endX,endY]
	global.souldropCollect=ds_list_create(); //format: unique coin id
	
	global.scanList=ds_list_create(); //format: id
	
	
	//not saved files
	addLocation = function(_npc,_room,_key,_x,_y,_xs,_ys,_path){
		if !variable_struct_exists(global.characters[$ _npc],"locations")  variable_struct_set(global.characters[$ _npc],"locations",{});
		if !variable_struct_exists(global.characters[$ _npc].locations,_room)  variable_struct_set(global.characters[$ _npc].locations,_room,{});
		global.characters[$ _npc].locations[$ _room][$ _key]={};
		global.characters[$ _npc].locations[$ _room][$ _key].startX=_x;
		global.characters[$ _npc].locations[$ _room][$ _key].startY=_y;
		global.characters[$ _npc].locations[$ _room][$ _key].xs=_xs;
		global.characters[$ _npc].locations[$ _room][$ _key].ys=_ys;
		if _path!="" global.characters[$ _npc].locations[$ _room][$ _key].path=_path;
	}
	addLocationPathFrom = function(_npc,_from,_fromRoom,_to,_toRoom,_path,_text){
		if !variable_struct_exists(global.characters[$ _npc].locations[$ _toRoom][$ _to],"pathFrom") variable_struct_set(global.characters[$ _npc].locations[$ _toRoom][$ _to],"pathFrom",{});
		if !variable_struct_exists(global.characters[$ _npc].locations[$ _toRoom][$ _to].pathFrom,_fromRoom) variable_struct_set(global.characters[$ _npc].locations[$ _toRoom][$ _to].pathFrom,_fromRoom,{});
		global.characters[$ _npc].locations[$ _toRoom][$ _to].pathFrom[$ _fromRoom][$ _from]={};
		global.characters[$ _npc].locations[$ _toRoom][$ _to].pathFrom[$ _fromRoom][$ _from].path=_path;
		if _text!="" global.characters[$ _npc].locations[$ _toRoom][$ _to].pathFrom[$ _fromRoom][$ _from].text=_text;
	}
	global.characters={};
	
	#region Test
	global.characters.test={
		portrait: [portTest],
		diagColor: c_nearWhite,
		font: fontSizes.medium,
	}
	addLocation("test","rTest1","t1",304,20,-1,1,"");
	addLocation("test","rTest1","t2",305,133,1,1,"test_rTest1_groundCycle");
		addLocationPathFrom("test","t1","rTest1","t2","rTest1","test_rTest1_fromBlockToGround","testTextWalk");
	#endregion
	
	#region Harold
	global.characters.harold={portrait: [portHarold],diagColor: c_nearWhite,font: fontSizes.harold};
	addLocation("harold","rTest1","t1",34,132,1,1,"");
	addLocation("harold","rNotdon","pro_electro",2183,719,1,1,""); //running the power demo
	#endregion
	 
	#region Citra
	global.characters.citra={portrait: [empty],diagColor: c_nearWhite,font: fontSizes.notdon};
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
	#endregion
	
	#region Eugene
	global.characters.eugene={portrait: [empty],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("eugene","rNotdon","pro_lb1",1320,404,-1,1,""); //offscreen in intro
	addLocation("eugene","rNotdon","pro_lb2",1136,404,-1,1,""); //play area
		addLocationPathFrom("eugene","pro_lb1","rNotdon","pro_lb2","rNotdon","simple","");
	addLocation("eugene","rNotdonArchives","pro_archEnter",172,324,-1,1,"enterFade"); //enter archives
	addLocation("eugene","rNotdonArchives","pro_archGuard",231,324,-1,1,"simpleBackAndForth{256,324,213,324}"); //guard archive ladder
	addLocation("eugene","rNotdonArchives","pro_arch1",96,324,-1,1,""); //examining bench in archives
		addLocationPathFrom("eugene","pro_lb2","rNotdon","pro_arch1","rNotdonArchives","simpleEnterRoom{1300,404}","");
	addLocation("eugene","rNotdon","pro_lb3",1063,403,-1,1,""); //waiting to jump
		addLocationPathFrom("eugene","pro_arch1","rNotdonArchives","pro_lb3","rNotdon","pro_eugene_archiveLeave","");
	addLocation("eugene","rNotdon","pro_lb4",1063,403,-1,1,""); //waiting to jump 2
	addLocation("eugene","rNotdon","pro_lbJump",1063,403,-1,1,""); //jumping in front of citra
		addLocationPathFrom("eugene","pro_arch1","rNotdonArchives","pro_lbJump","rNotdon","simpleEnterRoom{198,330}","");
		addLocationPathFrom("eugene","pro_archGuard","rNotdonArchives","pro_lbJump","rNotdon","simpleEnterRoom{198,330}","");
	addLocation("eugene","rNotdon","pro_grotto",719,612,1,1,""); //hanging on observatory tower
		addLocationPathFrom("eugene","pro_lb4","rNotdon","pro_grotto","rNotdon","pro_eugene_cliffJump","");
		addLocationPathFrom("eugene","pro_lbJump","rNotdon","pro_grotto","rNotdon","pro_eugene_cliffJump","");
	addLocation("eugene","rNotdon","pro_electro",2128,628,1,1,""); //watching the power demo
	addLocation("eugene","rNotdon","pro_reactor",2754,772,1,1,""); //standing under the reactor
	#endregion
	
	#region Nora
	global.characters.nora={portrait: [empty],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("nora","rNotdon","pro_lb1",1339,404,-1,1,""); //offscreen in intro
	addLocation("nora","rNotdon","pro_lb2",1155,404,-1,1,""); //play area
		addLocationPathFrom("nora","pro_lb1","rNotdon","pro_lb2","rNotdon","simple","");
	addLocation("nora","rNotdon","pro_lb3",1197,404,-1,1,""); //watching eugene jump from back of crowd
	addLocation("nora","rNotdon","pro_electro",2214,628,-1,1,""); //watching the power demo
	addLocation("nora","rNotdon","pro_reactorLeft",2244,628,1,1,""); //left of reactor
	addLocation("nora","rNotdon","pro_reactor",2691,772,1,1,""); //under reactor
		addLocationPathFrom("nora","pro_reactorLeft","rNotdon","pro_reactor","rNotdon","simpleAlwaysJump","");
	#endregion
	
	#region Smitten
	global.characters.smitten={portrait: [empty],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("smitten","rNotdon","pro_lb1",1358,404,-1,1,""); //offscreen in intro
	addLocation("smitten","rNotdon","pro_lb2",1174,404,1,1,""); //play area
		addLocationPathFrom("smitten","pro_lb1","rNotdon","pro_lb2","rNotdon","simple","");
	addLocation("smitten","rNotdon","pro_lb3",1160,404,-1,1,""); //watching eugene jump
	addLocation("smitten","rNotdon","pro_lb4",1270,404,-1,1,""); //blocking
		addLocationPathFrom("smitten","pro_lb3","rNotdon","pro_lb4","rNotdon","simple","");
	addLocation("smitten","rNotdon","pro_electro",2194,628,-1,1,""); //watching the power demo
	addLocation("smitten","rNotdon","pro_reactorLeft",2269,628,1,1,""); //left of reactor
	addLocation("smitten","rNotdon","pro_reactor",2715,772,1,1,""); //under reactor
		addLocationPathFrom("smitten","pro_reactorLeft","rNotdon","pro_reactor","rNotdon","simpleAlwaysJump","");
	addLocation("smitten","rNotdon","pro_launch",1808,676,-1,1,""); //inside launch control
		addLocationPathFrom("smitten","pro_reactor","rNotdon","pro_launch","rNotdon","pro_smitten_launchWalk","");
	addLocation("smitten","rNotdon","pro_launchWindow",1808,644,-1,1,""); //at launch window
		addLocationPathFrom("smitten","pro_launch","rNotdon","pro_launchWindow","rNotdon","pro_smitten_toWindow","");
	#endregion
	
	#region Charlie
	global.characters.charlie={portrait: [empty],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("charlie","rNotdon","pro_lb1",1302,404,-1,1,""); //offscreen in intro
	addLocation("charlie","rNotdon","pro_lb2",1118,404,1,1,""); //play area
		addLocationPathFrom("charlie","pro_lb1","rNotdon","pro_lb2","rNotdon","simple","");
	addLocation("charlie","rNotdon","pro_lb3",1109,404,-1,1,""); //watching eugene jump
	addLocation("charlie","rNotdon","pro_lb4",1063,403,-1,1,""); //getting the parachutes
		addLocationPathFrom("charlie","pro_lb3","rNotdon","pro_lb4","rNotdon","simple","");
		addLocationPathFrom("charlie","pro_lb5","rNotdon","pro_lb4","rNotdon","simple","");
	addLocation("charlie","rNotdon","pro_lb5",1181,403,-1,1,""); //walking over to you
		addLocationPathFrom("charlie","pro_lb4","rNotdon","pro_lb5","rNotdon","pro_charlie_ledgeJump","");
	addLocation("charlie","rNotdon","pro_electro",2296,650,-1,1,""); //watching the power demo
	addLocation("charlie","rNotdon","pro_electroPanic",2296,650,-1,1,"simpleBackAndForth{2280,705,2312,650}"); //panic
	addLocation("charlie","rNotdon","pro_electroTouch",2515,725,1,1,""); //touching the reactor
		addLocationPathFrom("charlie","pro_electroPanic","rNotdon","pro_electroTouch","rNotdon","simpleAlwaysJump","");
	addLocation("charlie","rNotdon","pro_reactorLeft",2160,628,1,1,""); //left of reactor
	addLocation("charlie","rNotdon","pro_reactor",2601,740,1,1,""); //close to reactor
		addLocationPathFrom("charlie","pro_reactorLeft","rNotdon","pro_reactor","rNotdon","simpleAlwaysJump","");
	#endregion
	
	#region Matt
	global.characters.matt={portrait: [empty],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("matt","rNotdon","pro_electro",2246,772,1,1,""); //chilling under rocks
	#endregion
	
	#region Chet
	global.characters.chet={portrait: [empty],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("chet","rNotdon","pro_search1",2137,628,1,1,""); //starting search
	#endregion
	
	#region Alex
	global.characters.alex={portrait: [empty],diagColor: c_nearWhite,font: fontSizes.notdon};
	addLocation("alex","rNotdonAmphitheater","c1_treadmill",196,256,1,1,"c1_treadmill"); //treadmill
	#endregion 
	
	#region Babish Orange
	global.characters.babishOrange={portrait:[empty],diagColor: c_nearWhite, font: fontSizes.myko};
	addLocation("babishOrange","rCoreIntro","pro_core",477,926,1,1,""); //core start
	#endregion
	
	#region Craig Krisper
	global.characters.craigKrisper={portrait:[empty],diagColor: c_nearWhite, font: fontSizes.myko};
	addLocation("craigKrisper","rCoreIntro","pro_core",444,926,1,1,""); //core start
	#endregion
	
	var _cL=variable_struct_get_names(global.characters) //add arbitray yscale and check to each character
	for (var i=0;i<array_length(_cL);i++)
	{
		var _rm=room_get_name(global.characterLocations[? _cL[i]][2]);
		if global.characterLocations[? _cL[i]][4]!=""
		{
			global.characterLocations[? _cL[i]][0]=global.characters[$ _cL[i]].locations[$ _rm][$ global.characterLocations[? _cL[i]][4]].startX;
			global.characterLocations[? _cL[i]][1]=global.characters[$ _cL[i]].locations[$ _rm][$ global.characterLocations[? _cL[i]][4]].startY;
		}
		global.characters[$ _cL[i]].ys=1;
		global.characters[$ _cL[i]].ch=1;
	}
	global.characterNames=[];
	global.music=-1;
	global.regionMusic=[mus_notdon,-1,-1,-1,-1,-1,-1,-1];
	global.itemData=ds_map_create();
	ds_map_add(global.itemData,"iGrapple",{
		index: 0,
		viewable: false
		//itemName : loads in setText
		//flavortext : loads in setText
	});
	ds_map_add(global.itemData,"iGrappleSwing",{index: 0, viewable: false});
	ds_map_add(global.itemData,"iGrappleArc",{index: 0, viewable: false});
	ds_map_add(global.itemData,"iGrappleDown",{index: 0, viewable: false});
	ds_map_add(global.itemData,"iGrappleAir",{index: 0, viewable: false});
	ds_map_add(global.itemData,"iSlate",{index: 2, viewable: false});
	ds_map_add(global.itemData,"iPlank",{index: 1, viewable: true});
	ds_map_add(global.itemData,"iPhoneNote1",{index: 2, viewable: true});
	ds_map_add(global.itemData,"iPhoneNote2",{index: 2, viewable: true});
	ds_map_add(global.itemData,"iPhoneNote3",{index: 2, viewable: true});
	for (var i=1;i<sprite_get_number(sArchivesWrenchesPopup);i++) ds_map_add(global.itemData,"iWrench"+string(i),{index: 3, viewable: true});
	ds_map_add(global.itemData,"iRocketBook",{index: 5, viewable: true});
	ds_map_add(global.itemData,"iSolitaire",{index: 6, viewable: true});
	global.regions=-1; //loads in setText
	global.rooms={}
	addRoomCamera=function(roomName,left,top,right,bottom,xPos,yPos,condition){
		if is_undefined(condition) condition=-1;
		array_push(global.rooms[$ roomName].camera,[left,top,right,bottom,xPos,yPos,condition]);
	}
	addSoulCamera=function(roomName,left,top,right,bottom,xPos,yPos,condition){
		if is_undefined(condition) condition=-1;
		array_push(global.rooms[$ roomName].soulCamera,[left,top,right,bottom,xPos,yPos,condition]);
	}
	addBothCamera=function(roomName,left,top,right,bottom,xPos,yPos,condition){
		if is_undefined(condition) condition=-1;
		array_push(global.rooms[$ roomName].camera,[left,top,right,bottom,xPos,yPos,condition]);
		array_push(global.rooms[$ roomName].soulCamera,[left,top,right,bottom,xPos,yPos,condition]);
	}
	if file_exists("rooms.json") global.rooms=loadStringJson("rooms"); //precalculate the room data
	else {
	for (var i=0;room_exists(i);i++) if i!=rStartup 
	{
		var _name=room_get_name(i);
		var _ln=string_lower(_name);
		var _reg=worldRegion.notdon;
		if string_pos("wastes",_ln)>0||string_pos("titan",_ln)>0 _reg=worldRegion.west;
		else if string_pos("air",_ln)>0 _reg=worldRegion.sky;
		else if string_pos("breadnought",_ln)>0 _reg=worldRegion.breadnought;
		else if string_pos("deep",_ln)>0 _reg=worldRegion.deeptown;
		else if string_pos("isla",_ln)>0 _reg=worldRegion.east;
		else if string_pos("core",_ln)>0 _reg=worldRegion.core;
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
	global.rooms.rTitle.darkness=0;
	//global.rooms.rTest1.npcs=[npcTest,npcHarold];
		addRoomCamera("rCoreIntro",576-192,980-192,576+192,980+192,576,980); //center
	global.rooms.rNotdon.npcs=[npcCharlie,npcEugene,npcCitra,npcHarold,npcNora,npcSmitten,npcChet,npcMatt];
	global.rooms.rNotdon.inside=false;
		addRoomCamera("rNotdon",1562,0,1778,546,1620,468); //bounce pad
		addRoomCamera("rNotdon",2216,698,2562,2000,2374,798,"notdonEraPastPro3"); //the nook
		addRoomCamera("rNotdon",1786,556,1920,768,1760,"y","notdonEraLaunchExists"); //mission control
		addSoulCamera("rNotdon",928-172,398-148,1052,398+108,914,398); //cliffside
		addSoulCamera("rNotdon",3444,1148,5000,1336,"x",1294); //pier
		addRoomCamera("rNotdon",1254,530,1782,660,"x",598); //launch level 1
		addRoomCamera("rNotdon",1254,660,1782,842,"x",748); //launch level 2
	//global.rooms.rNotdonArchives.npcs=[npcEugene,npcCitra];
	addRoomCamera("rNotdonAdults",384,216,768,432,576,324);
	addBothCamera("rWastesNotdon",762,-20,1251,212,963,108); //wastes transition tunnel
	}
	
	global.persistentEvents=ds_map_create(); //Format: object id, 4 indexes of data
	
	//misc globalvars
	global.roomTime=0;
	global.cam=-1;
	global.zoomStep=0;
	global.zoomLevel=1;
	global.zoomTo=1;
	
	global.lightSurf=-1;
	global.lightAlpha=0;
	global.lightObj=[ply,oGrapple,npcCitra,npcHarold,
	oSave,
	oGravityField,
	oPowerPlantTemp,
	];
	
	global.coinColorPoint=4280556782;
	
	global.npcStates={};
	
	global.guiSurf=-1;
	global.interactText=-1;
	global.interactTextLabels=[]; //loads in setText
	global.fonts=[
	[],
	[small1440,med1440,large1440,extralarge1440,harold1440],
	[]
	];
	if array_length(global.fonts[round(global.guiScale*3)-3])==0 global.guiScale=4/3; //default to 1440p if fonts aren't added
	global.hudColorList=[make_color_rgb(96,92,169)]; //possible colors for the hud
	
	global.controllerConnected=false;
	global.controllerSlot=-1;
	global.controllerType=-1;
	
	global.pathfindingScripts=-1;
	global.grav=0.2;
	
	global.maxDamage=127;
	global.inWater=false;
	
	global.blurObj=ds_list_create();
	global.reflectObj=ds_list_create();
	
	global.controllerInputs=[
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
	[gp_stickr] //debug
	];
	global.keyboardInputs=[
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
	[ord("T")] //debug
	];
	global.numOfInputs=array_length(global.keyboardInputs);
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
	
	//dev exceptions
	global.devSkips=false;
	global.devTeleport=false;
	if isDev
	{
		global.devTeleport=true;
		global.devSkips=true;
		global.startRoom=rWastesRocketStand;
		ds_list_add(global.playerItems,"iGrapple",1,"iGrappleSwing",1,"iGrappleDown",1,"iGrappleArc",1);
	}
	else if isTest
	{
		global.startRoom=rCoreIntro;
		addData("respInt");
		global.devTeleport=true;
		global.devSkips=true;
		ds_list_add(global.playerItems,"iGrapple",1,"iSolitaire",1);
		global.notdonEra=notdonEras.present;
		scr_pro_4();
		global.startRoom=rNotdon;
	}
	
	
	//npc sprite mask data
	global.physCollPoints=ds_map_create();
	ds_map_add(global.physCollPoints,"sPly",[[-3,2,-3,2,-3,2,-3,2],[8,8,4,4,-1,-1,6,6]]);
	ds_map_add(global.physCollPoints,"sTestPersonBig",[[-8,7,-1],[11,11,-8]]);
	ds_map_add(global.physCollPoints,"sTestPersonHarold",[[-8,7,-1],[11,11,-8]]);
	ds_map_add(global.physCollPoints,"sGrapple",[[-3,3,-3,3],[-3,3,-3,3]]);
	ds_map_add(global.physCollPoints,"sPlaceholderBounce",[[-12,12],[4,4]]);
	ds_map_add(global.physCollPoints,"sPlaceholderBounceAngle",[[-12,12],[11,11]]);
}