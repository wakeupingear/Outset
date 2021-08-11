/// @description Typing
if alarm[0]>-1 keyboard_string="Stop";
if keyboard_check_pressed(vk_enter)
{
	if string_letters(keyboard_string)!=""
	{
		ds_list_add(commands,keyboard_string);
		var _lower=string_replace_all(string_lower(keyboard_string)," ","");
		if string_pos("tp",_lower)==1
		{
			var _coords=explodeString(" ",_lower);
			if instance_exists(ply)
			{
				try
				{
					ply.x=real(_coords[1]);
					ply.y=real(_coords[2]);
					instance_destroy();
				}
				catch (e) show_debug_message("ERROR: invalid coords");
			}
		}
		else if string_pos("echo",_lower)==1
		{
			keyboard_string=string_copy(keyboard_string,6,string_length(keyboard_string)-5);
			ds_list_add(commands,keyboard_string);
		}
		else switch _lower
		{
			case "killplayer":
			case "kill":
				killPlayer();
				instance_destroy();
				break;
			case "killall":
				ds_list_add(commands,"Killed "+string(instance_number(enem))+" Enemies");
				with enem hurtEnem(id,global.maxDamage);
				break;
			case "save":
				save();
				break;
			case "filesize":
				var _f=file_bin_open("file"+string(global.lastFile)+".ini", 0);
				ds_list_add(commands,"File "+string(global.lastFile)+":  "+string(file_bin_size(_f)/1000)+"KB");
				file_bin_close(_f);
				break;
			case "timer":
				ds_list_add(commands,0);
				alarm[0]=1;
				break;
			case "stop":
				alarm[0]=-1;
				break;
			case "end":
				if !instance_exists(oTextbox) ds_list_add(commands,"No textbox currently exists");
				else
				{
					instance_destroy(oTextbox);
					instance_destroy();
				}
				break;
			case "restart":
			{
				game_restart();
				break;
			}
			case "reload":
			{
				global.devTeleport=true;
				room_restart();
				instance_destroy();
				break;
			}
			case "coord":
			case "coords":
			{
				ds_list_add(commands,"X: "+string(ply.x)+"; Y: "+string(ply.y));
				break;
			}
			case "quit":
			case "exit": 
			{
				game_end();
				break;
			}
			default:
			{
				if ds_map_exists(rooms,keyboard_string)
				{
					global.devTeleport=true;
					room_goto(rooms[? keyboard_string]);
					instance_destroy();
				}
				else
				{
					try
					{
						var _args=explodeString(",",keyboard_string);
						_args[0]=asset_get_index(_args[0]);
						switch array_length(_args)
						{
							case 2:
							{
								_return=script_execute(_args[0],_args[1]);
								break;
							}
							case 3:
							{
								_return=script_execute(_args[0],_args[1],_args[2]);
								break;
							}
							case 4:
							{
								_return=script_execute(_args[0],_args[1],_args[2],_args[3]);
								break;
							}
							default:
							{
								_return=script_execute(_args[0]);
								break;
							}
						}
						if !is_undefined(_return) 
						{
							try
							{
								if !is_string(_return) _return=string(_return);
								ds_list_add(commands,"--> "+_return);
							}
							catch(e) ds_list_add(commands,"ERROR: invalid return type");
						}
					}
					catch (e)
					{
						ds_list_add(commands,"CMD not found: '"+keyboard_string+"'");
					}
				}
				break;
			}
		}
	}
	keyboard_string="";
}

if keyboard_check_pressed(vk_escape) instance_destroy();