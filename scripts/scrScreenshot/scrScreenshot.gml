// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screenshot(){
	var _num=1
	var _file = "Outset-"+string(current_month)+"-"+string(current_day)+"-"+string(current_hour)+":"+string(current_minute);
	while file_exists(_file+"_"+string(_num)) _num++
	screen_save(_file)
	if steam_is_screenshot_requested() steam_send_screenshot(_file, window_get_width(), window_get_height());
}