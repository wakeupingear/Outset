function setDiscordStatus(){
	with controller 
	{
		if global.discordActive&&is_array(global.discordText)
		{
			var _ind=0;
			var _rName=room_get_name(room);
			if variable_struct_exists(global.rooms,_rName) _ind=global.rooms[$ _rName].region;
			np_setpresence(global.discordText[_ind], "", "slogo1024", "");
		}
	}
}