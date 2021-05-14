

function screenshot(){
	var _num=1
	var _file = "Outset-"+string(current_month)+"-"+string(current_day)+"-"+string(current_hour)+":"+string(current_minute);
	while file_exists(_file+"_"+string(_num)) _num++
	screen_save(_file)
	if steam_is_screenshot_requested() steam_send_screenshot(_file, window_get_width(), window_get_height());
}