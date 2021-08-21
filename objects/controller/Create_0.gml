if instance_number(controller)>1 instance_destroy();
else{
window_set_position(display_get_width()/4,display_get_height()/4);
window_set_size(1280,720);
draw_set_color(c_white);
application_surface_draw_enable(false);

math_set_epsilon(0.0001);
audio_group_load(audiogroup_sounds);
audio_group_load(audiogroup_music);

#macro isDev (os_get_config()=="Dev")
#macro isNewFile (os_get_config()=="NewFile")
#macro isTest (os_get_config()=="Testing")
#macro isHtml (os_browser!=browser_not_a_browser)
if isHtml
{
	base_width = 384;
	base_height = 216;
	width = base_width;
	height = base_height;
}

if (!isDev&&!isTest)//||true
{
	randomize();
	window_set_cursor(cr_none);
}
else if isDev||isTest
{
	if !instance_exists(oDebugOverlay) event_perform(ev_keypress,vk_f3);
}
//gml_pragma("PNGCrush");

#macro STEAM_ID 1256900
#macro DISCORD_APP_ID "859197742147436554"
if (!np_initdiscord(DISCORD_APP_ID, true, STEAM_ID))
{
	show_debug_message("Failed to connect to Discord");
}

#macro c_nearBlack make_color_rgb(25,25,25)
#macro c_nearWhite make_color_rgb(230,230,230)
#macro c_darkBlue make_color_rgb(0,0,25)
#macro c_soulBlue make_color_rgb(58,61,146)
//#macro c_coinColorPoint [4280556782,4280556782,4280556782,4280556782,4280556782,4280556782,4280556782,4280556782,4280556782,4280556782,4280556782]
#macro leftStickUp 300
#macro leftStickDown 301
#macro leftStickLeft 302
#macro leftStickRight 303
#macro rightStickUp 304
#macro rightStickDown 305
#macro rightStickLeft 306
#macro rightStickRight 307

enum worldRegion {
	title,
	notdon,
	west,
	air,
	breadnought,
	deeptown,
	east,
	core,
	vr,
	testing
}
enum times{
	day,
	night,
	sunrise,
	sunset
}
enum notdonEras{
	myko,
	pro1,
	pro2,
	pro3,
	present,
	goodFuture,
	future
}

enum animType {
	pingPong,
	oneOff,
	loop,
	singleFrame
}

enum moveState {
	floating,
	ladder,
	ladderMove,
	standing,
	running,
	jumping,
	falling,
	//grapple specific
	pulling,
	hanging,
	zipline
}

enum grappleState {
	pull,
	arc,
	swing,
	down
}

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
	noclip
}
rumble=[0,0];
rumbleDown=[0,0];
rumbleStep=0;

enum controllerType {
	nintendo,
	xbox,
	dualshock,
	dualsense,
	steam,
	generic
}

enum transitions {
	blackToBlack=0,
	blackToWhite=1,
	whiteToWhite=2,
	blackSudden=3,
	whiteSudden=4,
	instant=5,
}

enum fontSizes {
	small,
	medium,
	large,
	extraLarge,
	harold,
	citra,
	notdon,
	myko
}

enum chapters {
	prologue,
	c1,
	air,
	island,
	wastes,
	deep
}

enum dungeons {
	vr,
	water,
	factory,
	temple,
	vents,
	needle,
	lab,
	junkyard,
	stronghold,
	core
}
scrVariables();
loadPrefs();
setFont(fontSizes.medium);
instance_create_depth(0,0,depth-1,oMouse);

//hud alpha
image_alpha=0;
getHudX=function(){
	return twerp(TwerpType.in_sine,0,64*(!global.hudSide-global.hudSide)-24,image_alpha);//+camX()
}
hudFade=1;
scanTime=0;
itemIndex=0;
itemIndexTime=0;

//pause variables
surfPosX=0;
surfPosY=0;
pauseAlpha=0;
pauseAlphaMax=0.6;
pauseMenuButtons={
	musVol: {type: "slider", range: 11, variable: true},
	sfxVol: {type: "slider", range: 11, variable: true},
	fullscreen: {type: "toggle", variable: true},
	camShake: {type: "toggle"},
	interactPrompt: {type: "toggle"},
	highlightPlayer: {type: "toggle"},
	highlightHook: {type: "toggle"},
	highlightNPC: {type: "toggle"},
	guiScale: {type: "special"},
	guiSide: {type: "toggle", labels: "guiSide", variable: true},
	flashes: {type:"toggle"},
	quitTitle: {type: "special"},
	quitDesktop: {type: "special"},
	
	menu1: [
		"fullscreen",
		"musVol",
		"sfxVol",
		"controls",
		"gameplay",
		"visuals",
		"quitTitle",
		"quitDesktop"
	],
	
	gameplay: [
		"interactPrompt"
	],
	
	visuals: [
		"guiScale",
		"shake",
		"flashes",
		"highlightPlayer",
		"highlightHook",
		"highlightNPC"
	],
	
	controls:[
	]
};
pauseMenuCurrent="menu1";
pausePos=0;
pauseMenuCopied=-1;
loadMenu=function(menuKey){
	if variable_struct_exists(pauseMenuButtons, menuKey)
	{
		removeMenuButtons();
		var _struct=pauseMenuButtons[$ menuKey];
		var _labels=textLoad("pauseLabels");
		var _first=-1;
		var _previous=-1;
		for (var i=0;i<array_length(_struct);i++)
		{
			var _b=instance_create_depth(192,200-(array_length(_struct)-i)*24,depth,oPauseButton);
			if i==0 _first=_b;
			else _previous.next=_b;
			_b.previous=_previous;
			_b.pos=0;
			_b.struct=pauseMenuButtons[$ _struct[i]];
			_b.key=_struct[i];
			_b.text=_labels[$ _struct[i]];
			if is_array(pauseMenuButtons[$ _struct[i]]) _b.type="menu";
			else if variable_struct_exists(pauseMenuButtons[$ _struct[i]],"labels") _b.text=pauseMenuButtons[$ _struct[i]].labels;
			with _b event_user(0);
			_previous=_b;
		}
		_first.previous=_previous;
		_previous.next=_first;
	}
}
removeMenuButtons=function(){
	if instance_exists(oPauseButton) instance_destroy(oPauseButton);
}

persistentEventsSet=function(key){
	if !is_string(key) key=room_get_name(key);
	if ds_map_exists(global.persistentEvents,key){
	var _arr=global.persistentEvents[? key];
	for (var i=0;i<array_length(_arr);i+=5)
	{
		var _layer=_arr[i+3];
		if _layer=="any" _layer=-1;
		else _layer=layer_get_id(_layer);
		switch (_arr[i])
		{
			case oParachute:
				var _obj=instance_nearest(x,y,_arr[i+1]);
				var _p=instance_create_depth(_obj.x,_obj.y,_obj.depth+1,oParachute);
				_p.target=_obj
				break;
			case oVBarrier:
				var _d=instance_create_layer(tCoord(_arr[i+1]),tCoord(_arr[i+2]),_layer,_arr[i]);
				_d.image_xscale=_arr[i+4][0];
				break;
			case oCutsceneDelay:
				var _exists=false;
				/*if key!="any"&&room_get_name(room)!=key _exists=false;
				else for (var k=0;k<instance_number(_arr[i]);k++) 
				{
					var _obj=instance_find(_arr[i],k);
					if _obj.key==_arr[i+1]&&_ofbj.delay==_arr[i+2]&&array_equals(_obj.args,_arr[i+4])
					{
						_exists=true;
						break;
					}
				}*/
				if !_exists
				{
					var _d=instance_create_depth(0,0,0,_arr[i]);
					_d.force=(_arr[i+3]=="force");
					_d.key=_arr[i+1];
					_d.originalKey=_d.key;
					_d.delay=_arr[i+2];
					_d.delayCount=_d.delay;
					_d.mode=(!is_real(_d.delay));
					_d.args=_arr[i+4];
					_d.startroom=key;
					//_d.persistent=(key=="any"); //to simplify this, the "any" event is run after every room so persistance is irrelevent
				}
				break;
			default:
				var _d=instance_create_layer(tCoord(_arr[i+1]),tCoord(_arr[i+2]),_layer,_arr[i]);
				//_d.depth--; //screws up layering, causing crashes
				_d.args=_arr[i+4];
				break;
		}
	}
	}
}

if !isDev 
{
	if isTest 
	{
		load(global.lastFile);
		room_goto(global.nextRoom);
	}
	else room_goto(rTitle);
}
else
{
	global.menuOpen=false;
	load(0);
	global.plyX=192; //override starting dev coordinates
	global.plyY=71;
	room_goto(global.nextRoom);
	//event_perform(ev_room_start,0);
}
}