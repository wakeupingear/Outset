	//cutscene specific scripts go here
function scr_pro_2(){
	addData("respInt");
	global.notdonEra=notdonEras.pro2;
	global.startX=1772;
	global.startY=455;
	global.startRoom=rNotdon;
	global.menuOpen=false;
	global.timeOfDay=times.night;
	setRoomLighting(room_get_name(room));
	
	//destroy all old objects
	destroyArray([oMissile],false);
	destroyArray([oVShip,oVBarrier,oExplosion,npc]);
	
	var _str={key:"pro_electroTest",condition:"plyRight",args:[2082]};
	_str[$ "room"]="rNotdon"
	createCutsceneDelay(_str,"cutsceneCondition");
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
	global.startRoom=rNotdon;
	global.menuOpen=false;
	global.timeOfDay=times.day;
	setRoomLighting(room_get_name(room));
	
	//destroy all old objects
	destroyArray([oMissile],false);
	destroyArray([oVShip,oVBarrier,oExplosion,npc]);
	
	var _str={key:"pro_reactorRace",delay:100,args:[]};
	_str[$ "room"]="rNotdon"
	//createCutsceneDelay(_str,"cutsceneDelay");
	//position characters
	setNPCRoom("citra","rNotdon","pro_reactor");
	setNPCRoom("eugene","rNotdon","pro_reactor");
	setNPCRoom("nora","rNotdon","pro_reactorLeft");
	setNPCRoom("smitten","rNotdon","pro_reactorLeft");
	setNPCRoom("harold","rNotdon","pro_electro");
	setNPCRoom("charlie","rNotdon","pro_reactorLeft");
	setNPCRoom("matt","rNotdon","pro_electro");
	
	ds_list_add(global.droppedItems,"iPhoneNote1",3191,856,rNotdon);
	
	with controller
	{
		setRoomEra(); //reload npcs and era layers
		createNPCs();
		createDroppedItems();
		setTerrain();
	}
	
	save(global.lastFile);
}