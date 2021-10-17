/// @description Fullscreen toggle
window_set_fullscreen(!window_get_fullscreen());
if !window_get_fullscreen()&&!isHtml 
{
	window_set_size(1280,720);
	alarm[4]=5; //needs to be called later
}
global.accessibility[? "fullscreen"]=window_get_fullscreen(); //save choice
savePrefs();