/// @description Typing
if alarm[0]>-1 keyboard_string="Stop";
if keyboard_check_pressed(vk_enter)
{
	if string_letters(keyboard_string)!=""
	{
		ds_list_add(commands,keyboard_string);
		var _arr=explodeString(" ",keyboard_string);
		var _lower=string_lower(_arr[0]);
		switch _lower
		{
			case "echo":
				ds_list_add(commands,_arr[1]);
				break;
			case "fps":
				game_set_speed(_arr[1],gamespeed_fps);
				break;
			case "tp":
				if instance_exists(ply)
				{
					try
					{
						ply.x=real(_arr[1]);
						ply.y=real(_arr[2]);
						oCamera.x=ply.x;
						oCamera.y=ply.y;
						oCamera.xTo=oCamera.x;
						oCamera.yTo=oCamera.y;
						instance_destroy();
					}
					catch (e) show_debug_message("ERROR: invalid coords");
				}
				break;
			case "pp":
				controller.pp=!controller.pp;
				instance_destroy();
				break;
			case "compare":
			case "ppcompare":
				controller.ppCompare=!controller.ppCompare;
				instance_destroy();
				break;
			case "testing":
				controller.alarm[3]=-1;
				instance_destroy();
				break;
			case "killplayer":
			case "kill":
				killPlayer();
				instance_destroy();
				break;
			case "add":
			case "item":
			case "additem":
				if !ds_map_exists(global.itemData,_arr[1])
				{
					ds_list_add(commands,"Item doesn't exist");
				}
				else
				{
					addItem(_arr[1],false);
					instance_destroy();
				}
				break;
			case "respawn":
				if global.alive
				{
					ds_list_add(commands,"Not dead yet");
					break;
				}
				respawn(oPlayerSoul.x,oPlayerSoul.y);
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
				game_restart();
				break;
			case "reload":
				global.devTeleport=true;
				room_restart();
				instance_destroy();
				break;
			case "coord":
			case "coords":
				ds_list_add(commands,"X: "+string(ply.x)+"; Y: "+string(ply.y));
				break;
			case "quit":
			case "exit": 
				game_end();
				break;
			default:
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
	keyboard_string="";
}

if keyboard_check_pressed(vk_escape) instance_destroy();

with controller if alarm[3]>-1 alarm[3]++;