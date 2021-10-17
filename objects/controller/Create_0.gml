if instance_number(controller)>1 instance_destroy();
else{
draw_set_color(c_white);
application_surface_draw_enable(false);
postProcessSurf=-1;
pp=true; //hehe pp
ppCompare=false; // :===D hehe
removePPPart=function(){
	surface_reset_target();
	var _w=192+(!ppCompare)*192;
	var _h=216;
	surface_copy_part(application_surface,0,0,postProcessSurf,0,0,_w,_h);
	//draw_surface_part(postProcessSurf,0,0,_w,_h,0,0);
}
distSurf=-1;
distortion_stage=shader_get_sampler_index(shd_distort, "distortion_texture_page");
deathGlowProg=0;

fogTime=0;

math_set_epsilon(0.0001);
audio_group_load(audiogroup_sounds);
audio_group_load(audiogroup_music);

#macro isDev (os_get_config()=="Dev")
#macro isNewFile (os_get_config()=="NewFile")
#macro isTest (os_get_config()=="Testing")
#macro isHtml (os_browser!=browser_not_a_browser)
#macro isFinal (!isTest&&!isDev)
if isHtml
{
	base_width = 384;
	base_height = 216;
	width = base_width;
	height = base_height;
}
else 
{
	window_center();
	window_set_size(1280,720);
}

if isFinal
{
	//gml_pragma("PNGCrush");
	gml_pragma("UnityBuild", "true");
	randomize();
}

display_reset(0,false); //allows fps to be changed for debugging
if (!isDev&&!isTest)//||true
{
	display_reset(0,true);
	window_set_cursor(cr_none);
}
else if isDev||isTest
{ 
	if !instance_exists(oDebugOverlay) event_perform(ev_keypress,vk_f3);
	if isTest alarm[3]=20*60;
}
window_center();

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
#macro COLOUR_FOR_NO_MOVE make_colour_rgb(127,127,255)
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

//tileset management
animatedTiles=ds_list_create();
validAnimatingTiles=[
	[tilNotdon, tilNotdonNoAnim]
];
setTileAnimations=function(on){
	for (var i=0;i<ds_list_size(animatedTiles);i++)
	{
		var _tileID=layer_tilemap_get_id(animatedTiles[|i][0]);
		tilemap_tileset(_tileID,validAnimatingTiles[animatedTiles[|i][1]][1-on]);
	}
}

scrVariables();
loadPrefs();
save("TEMPLATE"); //template of default variable data - used when creating new save files
setFont(fontSizes.medium);
instance_create_depth(0,0,depth-1,oMouse);

//hud alpha
image_alpha=0;
getHudX=function(){
	return (image_alpha)*64*(!global.hudSide-global.hudSide)-24;//+camX()
}
hudFade=1;
scanTime=0;
itemIndex=0;
itemIndexTime=0;
lastCamX=0;
lastCamY=0;

//pause variables
surfPosX=0;
surfPosY=0;
pauseAlpha=0;
pauseAlphaMax=0.6;
prefsChanged=false;
closePauseMenu=function(){
	with oCursor if persistent instance_destroy();
	savePrefs();
	ds_stack_clear(menuStack);
	pauseMenuCurrent="menu1";
	if sprite_exists(pauseMenuCopied)
	{
		sprite_delete(pauseMenuCopied);
	}
	surfPosX=0;
	surfPosY=0;
	with oPauseButton destroy=true;
	instance_activate_all();
	if prefsChanged&&!instance_exists(oSaveIcon) instance_create_depth(0,0,-10005,oSaveIcon);
	prefsChanged=false;
	if !hasData("reacSt") instance_deactivate_object(oSouldropCoin);
	global.notPause=true;
	//setRoomEra(); //only activate room specifc eras
	//there was a reason why I put this there because I left a comment
	//however I am bad at comments and didn't actually explain myself
	//I don't think this is needed since nothing within the game changes during the pause that requires an era reload
}
pauseMenuButtons={
	menu1: [
		"volume",
		"controls",
		"visuals",
		"accessibility",
		"quitTitle",
		"quitDesktop"
	],
	fullscreen: {type: "toggle"},
	musicVol: {type: "slider", startPos:0,endPos:1,tick:0.1},
	sfxVol: {type: "slider", startPos:0,endPos:1,tick:0.1},
	quitTitle: {type: "special"},
	quitDesktop: {type: "special"},
	
	volume:[
		"musicVol",
		"sfxVol"
	],
	
	controls:[
	],
	
	accessibility: [
		"interactText",
		"flashes",
		"highlightPlayer",
		"highlightHook",
		"highlightNPC"
	],
	interactText: {type: "toggle"},
	
	visuals: [
		"fullscreen",
		"guiScale",
		"guiSide",
		"camShake",
		"vsync",
	],
	guiScale: {type: "special"},
	guiSide: {type: "toggle", labels: "guiSide", variable: true},
	camShake: {type: "toggle"},
	vsync: {type: "toggle"},
	flashes: {type:"toggle"},
	highlightPlayer: {type: "toggle"},
	highlightHook: {type: "toggle"},
	highlightNPC: {type: "toggle"},
};
pauseMenuCurrent="menu1";
pausePos=0;
pauseMenuCopied=-1;
menuStack=ds_stack_create();
loadMenu=function(menuKey){
	if variable_struct_exists(pauseMenuButtons, menuKey)
	{
		//manage existing buttons
		with oPauseButton
		{
			active=false;
			selected=false;
		}
		
		var _struct=pauseMenuButtons[$ menuKey];
		var _labels=textLoad("pauseLabels");
		var _first=-1;
		var _previous=-1;
		var _total=array_length(_struct);
		for (var i=0;i<_total;i++)
		{
			if _struct[i]=="quitTitle"&&room==rTitle continue;
			var _b=instance_create_depth(192,108+round((i-_total/2+1)*26),depth-1,oPauseButton);
			if i==0 
			{
				_first=_b;
				_b.selected=true;
			}
			else _previous.next=_b;
			_b.previous=_previous;
			_b.pos=i;
			_b.struct=pauseMenuButtons[$ _struct[i]];
			_b.key=_struct[i];
			_b.text=_labels[$ _struct[i]];
			if is_array(pauseMenuButtons[$ _struct[i]]) _b.type="menu";
			//else if variable_struct_exists(pauseMenuButtons[$ _struct[i]],"labels") _b.text=pauseMenuButtons[$ _struct[i]].labels;
			with _b 
			{
				image_xscale=string_width(text)/guiX()/sprite_width+1;
				event_user(0);
				setChoiceXscale();
				draw(0,0); //pre-position
			}
			_previous=_b;
		}
		_first.previous=_previous;
		_previous.next=_first;
	}
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
				var _p=instance_create_layer(_obj.x,_obj.y,_obj.depth+1,oParachute);
				_p.target=_obj
				break;
			case oVBarrier:
				if instance_exists(oVShip)
				{
					var _d=instance_create_layer(tCoord(_arr[i+1]),tCoord(_arr[i+2]),_layer,_arr[i]);
					_d.image_index+=4*(_arr[i+4][0]==-1);
				}
				else
				{
					eventRemove(oVBarrier,room,_arr[i+1],_arr[i+2],_layer,_arr[i+4]);
				}
				break;
			case oDiagTrigger:
				var _d=instance_create_layer(tCoord(_arr[i+1]),tCoord(_arr[i+2]),_layer,_arr[i]);
				_d.args=_arr[i+4];
				_d.key=_arr[i+4][0];
				_d.onlyAlive=_arr[i+4][1];
				_d.persist=_arr[i+4][2];
				_d.delay=_arr[i+4][3];
				_d.image_xscale=_arr[i+4][4];
				_d.image_yscale=_arr[i+4][5];
				_d.isEventObj=true;
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
			case oInteractable:
				var _i=instance_create_layer(tCoord(_arr[i+1]),tCoord(_arr[i+2]),_layer,oInteractable);
				_i.args=_arr[i+4];
				with _i
				{
					visible=true;
					sprite_index=args[0];
					image_index=args[1];
					image_xscale=args[2];
					image_yscale=args[3];
					image_angle=args[4];
					image_blend=args[5];
					image_alpha=args[6];
					image_speed=args[7];
					self.key=args[8];
					check=args[9];
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

darknessAlpha=1; //controls drawing of light surface - needs to be changed when fading in darkness without changing global.lightAlpha
draw=function(edgeX,edgeY){
if !global.notPause//&&global.alive
{
	if !sprite_exists(pauseMenuCopied) //set based on camera before instances are deactivated
	{
		surfPosX=edgeX;
		surfPosY=edgeY;
	}
	else 
	{
		draw_clear_alpha(c_black,1);
		draw_sprite(pauseMenuCopied,0,surfPosX,surfPosY);
	}
	if image_alpha>0 image_alpha-=0.1;
}
else if !global.transitioning&&!global.menuOpen&&global.alive&&instance_exists(ply)&&instance_find(ply,0).object_index==ply
{
	if instance_exists(ply)&&ply.x<edgeX+80&&ply.y<edgeY+80
	{
		if hudFade>0.5 hudFade-=0.1;
	}
	else if hudFade<1 hudFade+=0.1;
	if image_alpha<1 image_alpha+=0.1;
}
else if image_alpha>0 image_alpha-=0.1;
if (instance_exists(ply)&&global.notPause)||pauseMenuCopied!=-1
{
	draw_set_alpha(hudFade); //only applies when alpha isn't explicitly set
	draw_sprite_ext(sHudHealth,0,getHudX()+edgeX,24+edgeY,1,1,0,global.hudColorList[global.hudColor],0.8*image_alpha*hudFade);
	draw_sprite_ext(sHudHealth,1,getHudX()+edgeX,24+edgeY,1,1,0,-1,image_alpha*hudFade);
	
	var _bossFight=noone;
	with boss if enemActive _bossFight=id;
	if instance_exists(_bossFight)
	{
		draw_sprite_ext(sHudHealth,0,384-(getHudX()+edgeX),24+edgeY,1,1,0,global.hudColorList[global.hudColor],0.8*image_alpha*hudFade);
	}
	
	if ds_list_size(global.inventory)>0
	{
		var _x=getHudX()+edgeX-12;
		var _y=52+edgeY;
		draw_sprite_ext(sHudItem,0,_x,_y,1,1,0,global.hudColorList[global.hudColor],0.8*image_alpha*hudFade);
		if buttonHold(control.item)
		{
			if ply.itemFillMax>0
			{
				draw_sprite_part(sHudItem,0,0,0,ceil(global.inputs[control.item]/ply.itemFillMax*24),24,_x-12,_y-12);
			}
			else if ply.itemFillMax==-1 //red
			{
				draw_sprite_ext(sHudItem,0,_x,_y,1,1,0,c_red,1);
			}
		}
		var _ind=global.itemData[? global.inventory[|global.itemSlot]].index;
		switch global.inventory[|global.itemSlot]
		{
			case "iFormula":
				itemIndexTime++;
				if itemIndexTime>15
				{
					itemIndexTime=0;
					itemIndex=!itemIndex
				}
				_ind+=itemIndex;
				break;
			default: break;
		}
		draw_sprite(sItems,_ind,getHudX()+edgeX-12,52+edgeY);
	}
	draw_set_alpha(1);
}


if pauseAlpha>0
{
	var _x=max(edgeX,surfPosX);
	var _y=max(edgeY,surfPosY);
	draw_set_alpha(pauseAlpha);
	draw_set_color(c_black);
	draw_rectangle(_x,_y,_x+384,_y+216,false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}
if !global.notPause with oPauseButton draw(0,0);
}
}