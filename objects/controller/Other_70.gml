/// @description Discord

var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady")
{
	np_setpresence_timestamps(date_current_datetime(), 0, false);
	np_setpresence_more("Small image text", "Large image text", false);
	
	//np_setpresence() should ALWAYS come the last!!
	global.discordActive=true;
	setDiscordStatus();
}