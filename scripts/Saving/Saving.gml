function save(_num){
	ini_open("file"+string(_num)+".ini");
	ini_write_real("Player","health",global.maxHealth);
	ini_write_real("Player","souldrop",global.souldrop);
	ini_write_real("Player","level",global.level);
	ini_write_real("Player","lies",global.lies);
	ini_write_real("Player","room",global.startRoom);
	ini_write_real("Player","x",global.startX);
	ini_write_real("Player","y",global.startY);
	ini_write_real("Player","hudColor",global.hudColor);
	ini_write_string("Player","name",global.name);
	ini_write_real("Player","xscale",global.startXscale);
	
	ini_write_string("Progress","data",ds_map_write(global.data));  //Attempting to WriteValue for unsupported type 6
	ini_write_string("Progress","playerItems",ds_list_write(global.playerItems));
	ini_write_string("Progress","characterLocations",ds_map_write(global.characterLocations));
	ini_write_string("Progress","droppedItems",ds_list_write(global.droppedItems));
	ini_write_string("Progress","visitedRooms",ds_list_write(global.visitedRooms));
	ini_write_string("Progress","soulDoors",ds_map_write(global.soulDoors));
	ini_write_string("Progress","souldrop",ds_list_write(global.souldropCollect));
	ini_write_string("Progress","scanList",ds_list_write(global.scanList));
	ini_write_string("Progress","persistentEvents",ds_map_write(global.persistentEvents));
	
	ini_write_real("Progress","playtime",global.playtime);
	ini_write_real("Progress","completedChapters",global.completedChapters);
	ini_write_string("Progress","currentChapter",global.currentChapter);
	ini_write_string("Progress","dungeonProgress",global.dungeonProgress);
	ini_write_real("Progress","timeOfDay",global.timeOfDay);
	ini_write_real("Progress","notdonEra",global.notdonEra);
	ini_close();
	
	if !instance_exists(oSaveIcon)&&room!=rStartup&&room!=rTitle instance_create_depth(0,0,-10005,oSaveIcon); //5 above dialogue
}

function load(_num){
	if !file_exists("file"+string(_num)+".ini")||isDev||isTest save(_num);
	ini_open("file"+string(_num)+".ini");
	global.maxHealth=ini_read_real("Player","health",6);
	global.souldrop=ini_read_real("Player","souldrop",0);
	global.level=ini_read_real("Player","level",0);
	global.lies=ini_read_real("Player","lies",0);
	global.plyHealth=ceil(global.maxHealth);
	global.startRoom=ini_read_real("Player","room",rTest1);
	global.nextRoom=global.startRoom;
	global.startX=ini_read_real("Player","x",192);
	global.plyX=global.startX;
	global.startY=ini_read_real("Player","y",71);
	global.plyY=global.startY;
	global.hudColor=ini_read_real("Player","hudcolor",0);
	global.name=ini_read_string("Player","name","");
	global.startXscale=ini_read_real("Player","xscale",1);
	ds_map_read(global.data,ini_read_string("Progress","data",""));
	ds_list_read(global.playerItems,ini_read_string("Progress","playerItems",""));
	ds_list_clear(global.inventory);
	for (var i=0;i<ds_list_size(global.playerItems);i+=2) 
	{
		if global.itemData[? global.playerItems[|i]].viewable ds_list_add(global.inventory,global.playerItems[|i],global.playerItems[|i+1]);
	}
	global.itemSlot=0;
	ds_map_read(global.characterLocations,ini_read_string("Progress","characterLocations",""));
	ds_list_read(global.droppedItems,ini_read_string("Progress","droppedItems",""));
	ds_list_read(global.visitedRooms,ini_read_string("Progress","visitedRooms",""));
	ds_map_read(global.soulDoors,ini_read_string("Progress","soulDoors",""));
	ds_list_read(global.souldropCollect,ini_read_string("Progress","souldrop",""));
	ds_list_read(global.scanList,ini_read_string("Progress","scanList",""));
	ds_map_read(global.persistentEvents,ini_read_string("Progress","persistentEvents",""));
	
	global.completedChapters=ini_read_real("Progress","completedChapters",0);
	global.playtime=ini_read_real("Progress","playtime",0);
	global.currentChapter=ini_read_real("Progress","currentChapter",chapters.prologue);
	global.dungeonProgress=ini_read_string("Progress","dungeonProgress",global.dungeonProgress);
	global.timeOfDay=ini_read_real("Progress","timeOfDay",times.day);
	global.notdonEra=ini_read_real("Progress","notdonEra",notdonEras.myko);
	
	if instance_exists(oGrapple) with oGrapple event_user(0);
	ini_close();
}


function savePrefs(){
	ini_open("prefs.ini");
	ini_write_string("Data","lang",global.lang);
	ini_write_real("Data","lastFile",global.lastFile);
	
	ini_write_real("Sound","sfx",global.sfxVol);
	ini_write_real("Sound","music",global.musicVol);
	
	ini_write_real("Settings","gui",global.guiScale);
	ini_write_real("Settings","guiSide",global.hudSide);
	ini_write_string("Settings","accessibility",ds_list_write(global.accessibility));
	ini_close();
}

function loadPrefs(){
	if !file_exists("prefs.ini")||isDev||isTest savePrefs();
	ini_open("prefs.ini");
	global.lang=ini_read_string("Data","lang","english");
	global.lastFile=ini_read_real("Data","lastFile",0);
	
	global.sfxVol=ini_read_real("Sound","sfx",0.8);
	global.musicVol=ini_read_real("Sound","music",0.5);
	
	global.guiScale=ini_read_real("Settings","gui",1);
	global.hudSide=ini_read_real("Settings","guiSide",0);
	ds_list_read(global.accessibility,ini_read_string("Settings","accessibility",""));
	ini_close();
	
	if !isHtml with controller event_perform(ev_alarm,0);
	else controller.alarm[0]=30;
	
	audio_group_set_gain(audiogroup_music,global.musicVol,0);
	audio_group_set_gain(audiogroup_sounds,global.sfxVol,0);
	
	display_set_gui_size(floor(1920*global.guiScale),floor(1080*global.guiScale));
	setFont(fontSizes.medium);
}