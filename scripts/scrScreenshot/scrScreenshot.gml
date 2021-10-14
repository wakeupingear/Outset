function screenshot(){
	var _num=0;
	var _file = "Outset-"+string(current_year)+"-"+string(current_month)+"-"+string(current_day)+"-"+string(current_hour)+"."+string(current_minute)+"."+string(current_second);
	while file_exists(_file+"_"+string(_num)) _num++;
	if (_num>0) _file+=+"_"+string(_num);
	_file+=".png";
	screen_save(_file);
	if steam_is_screenshot_requested() steam_send_screenshot(_file, window_get_width(), window_get_height());
}