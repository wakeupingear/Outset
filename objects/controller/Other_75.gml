/// @description Controllers
switch(async_load[? "event_type"])             // Parse the async_load map to see which event has been triggered
{
case "gamepad discovered":                     // A game pad has been discovered
    var pad = async_load[? "pad_index"];       // Get the pad index value from the async_load map
    gamepad_set_axis_deadzone(pad, 0.2);       // Set the "deadzone" for the axis
    gamepad_set_button_threshold(pad, 0.1);    // Set the "threshold" for the triggers
    global.controllerConnected=true;
	global.controllerSlot=pad;
	var _name=string_upper(gamepad_get_description(pad));
	if !isHtml&&steam_initialised() global.controllerType=controllerType.steam;
	else if string_pos("NINTENDO",_name)>0 global.controllerType=controllerType.nintendo;
	else if string_pos("XBOX",_name)>0 global.controllerType=controllerType.xbox;
	else if string_pos("DUALSENSE",_name)>0||string_pos("PS5",_name)>0 global.controllerType=controllerType.dualsense;
	else if string_pos("PLAYSTATION",_name)>0||string_pos("PS4",_name)>0 global.controllerType=controllerType.dualshock;
	else global.controllerType=controllerType.generic;
	
	show_debug_message("Gamepad connected");
    break;
case "gamepad lost":                           // Gamepad has been removed or otherwise disabled
	global.controllerConnected=false;
	global.controllerSlot=-1;
	global.controllerType=-1;
	show_debug_message("Gamepad disconnected");
    break;
}