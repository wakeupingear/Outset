// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function commandProcess(command){
	while true
	{
		if diag>=array_length(command)||is_undefined(command[diag])||command[diag]=="end"
		{
			return "stopDiag";
		}
		else if is_real(command[diag])
		{
			alarm[0]=command[diag];
			wait=true;
			diag++;
			return ""
		}
		else if string_pos("if",command[diag])==1||string_pos("$if",command[diag])==1
		{
			if string_pos("$if",command[diag])==1 command[diag]=string_copy(command[diag],2,string_length(command[diag])-1);
			var _num=string_digits(command[diag]);
			args=[];
			if is_array(command[diag+2]) args=command[diag+2];
			if diagCondition(command[diag+1],args) while command[diag]!="#true"+_num diag++;
			else while command[diag]!="#false"+_num diag++;
			diag++;
		}
		else if string_pos("question",command[diag])==1
		{
			questionNum=int64(string_digits(command[diag]));
			question=true;
			questionChoice=0;
			diag+=2;
			return command[diag-1];
		}
		else if string_char_at(command[diag],1)=="?"
		{
			var _name=string_copy(command[diag],2,string_length(command[diag])-1);
			if _name=="ply"
			{
				resetCharacterTestVars();
			}
			else
			{
				character=_name;
				if diag+1<array_length(command)&&is_real(command[diag+1]) 
				{
					portInd=command[diag+1];
					diag++;
				}
				setCharacterDiag();	
			}
			diag++;
		}
		else if string_char_at(command[diag],1)=="$"
		{
			var _data=string_replace_all(string_copy(command[diag],2,string_length(command[diag])-1)," ","");
			
			var _val=0;
			diag+=2;
			if diag-1<array_length(command) 
			{
				_val=command[diag-1];
			}
			
			var _obj=string_copy(_data,1,string_pos(".",_data)-1);
			var _name=string_replace(_data,_obj+".","");
			if _obj==_name _obj="";
			if _obj=="global"
			{
				variable_global_set(_name,_val);
			}
			/*else if asset_get_index(_obj)==-1
			{
				switch _name
				{
					case "cutsceneDelayCancel":
						cancelCutsceneDelay(_obj);
						break;
				}
			}*/
			else
			{
					if _obj!="" 
					{
						if is_string(_obj)&&string_pos("All",_obj)>0
						{
							_obj=asset_get_index(string_replace(_obj,"All",""));
						}
						else _obj=getObject(_obj);
					}
					if string_pos("alarm",_name)>0
					{
						var _num=int64(string_digits(_name));
						with _obj alarm[_num]=_val;
					}
					else switch _name
					{
						case "skip":
							skip=true;
							break;
						case "hurt":
							if _obj.object_index==ply hurtPlayer(_val,0,0);
							else _obj.myHealth-=_val;
							break;
						//camera
						case "zoom":
							global.zoomTo=_val[0];
							global.zoomStep=_val[1];
							oCamera.alarm[0]=1;
							break;
						case "camSpd":
							oCamera.camSpd=_val;
							break;
						case "camFollow":
							oCamera.followMode=1;
							oCamera.followObj=getObject(_val);
							break;
						case "camSetInstant":
						case "camSet":
							oCamera.followMode=0;
							if _val[0]!="x"
							{
								if is_string(_val[0])&&instance_exists(getObject(_val[0])) oCamera.xTo=getObject(_val[0]).x;
								else oCamera.xTo=_val[0];
							}
							if _val[1]!="y"
							{
								if is_string(_val[1])&&instance_exists(getObject(_val[1])) oCamera.yTo=getObject(_val[1]).y;
								else oCamera.yTo=_val[1];
							}
							if _name=="camSetInstant"
							{
								oCamera.x=oCamera.xTo;
								oCamera.y=oCamera.yTo;
							}
							break;
						case "camReset":
							with oCamera
							{
								camSpd=originalSpd;
								if instance_exists(oPlayerCam)
								{
									followMode=1;
									followObj=oPlayerCam;
								}
								else
								{
									followMode=0;
									xTo=room_width/2;
									yTo=room_height/2;
								}
							}
							diag--; //since no arguments needed
							break;
						case "follow":
							oCamera.followMode=1;
							oCamera.followObj=getObject(_val);
							break;
						case "path":
							oCamera.followMode=2;
							oCamera.followObj=_val;
							oCamera.followPathProgress=0;
							break;
						case "shake":
							oCamera.shakeX=_val[0];
							oCamera.shakeY=_val[0];
							oCamera.shakeTime=_val[2];
							break;
						case "reset":
							with oCamera
							{
								camSpd=originalSpd;
								if instance_exists(oPlayerCam)
								{
									followMode=1;
									followObj=oPlayerCam;
								}
								else
								{
									followMode=0;
									xTo=room_width/2;
									yTo=room_height/2;
								}
							}
							break;
						//npc
						case "name":
							global.characterLocations[? getNpc(_obj)][3]=_val;
							break;
						case "addVarQueue":
							var _ptr=variable_instance_get(_obj,_val[0])
							with _obj
							{
								ds_queue_enqueue(_ptr,_val[1])
							}
							break;
						case "addVar":
							var _ptr=variable_instance_get(_obj,_val[0])
							with _obj
							{
								ds_list_add(_ptr,_val[1]) //this is a hacky method that won't work if an object has multiple different data structures
								//but it's fine for limited uses
							}
							break;
						case "alpha":
							if !is_array(_val) _obj.image_alpha=_val;
							else
							{
								var _e=instance_create_depth(0,0,0,oEffectHelper);
								_e.obj=_obj;
								_e.alphaTo=_val[0];
								_e.alphaStep=_val[1];
							}
							break;
						case "userEvent":
							with _obj event_user(_val);
							break;
						case "index":
							_obj.image_index=_val;
							break;
						case "blend":
							_obj.image_blend=_val;
							break;
						case "sprite":
							_obj.sprite_index=asset_get_index(_val);
							break;
						case "mask":
							_obj.mask_index=asset_get_index(_val);
							break;
						case "persistent":
							_obj.persistent=_val;
							break;
						case "jump":
							_obj.jump=1;
							break;
						case "impulse":
							impulse(_val[0],_val[1],_obj);
							break;
						case "x":
							_obj.x=_val;
							break;
						case "y":
							_obj.y=_val;
							break;
						case "xscale":
							if !is_array(_val) _obj.image_xscale=_val;
							else
							{
								var _e=instance_create_depth(0,0,0,oEffectHelper);
								_e.obj=_obj;
								_e.xscaleTo=_val[0];
								_e.xscaleStep=_val[1];
							}
						case "yscale":
							if !is_array(_val) _obj.image_yscale=_val;
							else
							{
								var _e=instance_create_depth(0,0,0,oEffectHelper);
								_e.obj=_obj;
								_e.yscaleTo=_val[0];
								_e.yscaleStep=_val[1];
							}
							break;
						case "startAnimation":
							_obj.currentAnimation=_val;
							_obj.animating=true;
						case "stopAnimation":
							_obj.currentAnimation="";
							_obj.animating=true;
							break;
						case "sequence":
							var _seqID=_obj;
							var _seqX=_val[0];
							var _seqY=_val[1];
							if array_length(_val)>2&&layer_exists(layer_get_id(command[diag]))
							{
								layer_sequence_create(layer_get_id(_val[2]),_seqX,_seqY,_seqID);
							}
							else layer_sequence_create(layer_get_id("aboveAsset"),_seqX,_seqY,_seqID);
							break;
						case "resetText":
							_obj.text=[];
							break;
						case "speed":
							_obj.image_speed=_val;
							break;
						case "setText":
							if is_array(_val) _obj.text=_val;
							else _obj.text=textLoad(_val);
							break;
						case "pathfinding":
							pathfindingStart(_obj,_val);
							break;
						case "setIdleText":
							with _obj
							{
								var _l=global.characterLocations[? npcKey][4];
								var _n=capitalizeFirstLetter(npcKey);
								if variable_struct_exists(global.langScript,_l+_n+"Idle") text=textLoad(_l+_n+"Idle");
							}
							break;
						case "snapNPC":
							if asset_get_index(_obj)==-1 command[diag+1]="npc"+capitalizeFirstLetter(_obj);
							if !instance_exists(_obj) var _obj=instance_create_layer(0,0,"people",_obj);
							with _obj
							{
								pathfinding=false;
								move=0;
								jump=0;
								positionNpc(1);
							}
							break;
						case "createNPC":
							if asset_get_index(_val)==-1 _val="npc"+capitalizeFirstLetter(_val);
							lastObj=instance_create_layer(0,0,"people",asset_get_index(_val));
							break;
						case "create":
							lastObj=instance_create_depth(tCoord(_val[0]),tCoord(_val[1]),_val[2],asset_get_index(_val[3]));
							break;
						case "createLayer":
							lastObj=instance_create_layer(tCoord(_val[0]),tCoord(_val[1]),layer_get_id(_val[2]),asset_get_index(_val[3]));
							lastObj.depth--;
							break;
						case "destroy":
							instance_destroy(_obj);
							break;
						case "destroyPlace":
							if place_meeting(_val[0],_val[1],asset_get_index(_val[2])) instance_destroy(instance_place(_val[0],_val[1],asset_get_index(_val[2])));
							break;
						case "xy":
							_obj.x=_val[0];
							_obj.y=_val[1];
							break;
						//room
						case "setRoom":
							setNPCRoom(getNpc(_obj),_val[0],_val[1]);
							break;
						case "roomChange":
							roomChange(_val[0],_val[1],asset_get_index(_val[2]),_val[3],_val[4],_val[5],_val[6]);
							break;
						//data
						case "addItem":
							if !is_array(_val)
							{
								var _item=_val;
								processItem(_item);
								if instance_exists(oGrapple) with oGrapple event_user(0); //set upgrade variables
							}
							else
							{
								var _item=_val[0];
								processItem(_item);
								if instance_exists(oGrapple) with oGrapple event_user(0); //set upgrade variables
								if array_length(_val)>1 return textLoad("itemText")[$ _item][2];
							}
							break;
						case "removeItem":
							if is_array(_val) var _item=_val[0];
							else var _item=_val;
							diag+=2;
							var _rep=1;
							if is_array(_val)
							{
								_rep=_val[1];
							}
							var _pos=ds_list_find_index(global.playerItems,_item);
							if global.playerItems[|i+1]-_rep<=0 repeat 2 ds_list_delete(global.playerItems,_pos);
							else global.playerItems[|i+1]-=_rep;
							break;
						case "addData":
							addData(_val);
							break;
						case "removeData":
							if ds_list_find_index(global.data,_val)>-1 ds_list_delete(global.data,ds_list_find_index(global.data,_val));
							else show_debug_message("Error: Trying to remove "+_val+" from global.data.");
							diag+=2;
							break;
						case "script":
							if is_array(_val)
							{
								script_execute_ext(asset_get_index(_val[0]),_val[1]);
							}
							else script_execute(asset_get_index(_val));
							break;
						//cutscene
						case "cutscene":
							cancelCutsceneDelay(_val);
							text=textLoad(_val);
							diag=0;
							command=text;
							break;
						case "cutsceneCondition":
						case "cutsceneDelay":
							createCutsceneDelay(_val,_name);
							break;
						case "cutsceneDelayCancel":
							cancelCutsceneDelay(_val);
							break;
						case "font":
							font=asset_get_index(_val);
							fontOverride=true;
							break;
						case "port": //keep
							portInd=_val;
							break;
						case "portLeft": //keep
							portLeft=_val;
							for (var i=0;i<array_length(portLeft);i++) portLeft[i]=asset_get_index(portLeft[i]);
							portOverride=true;
							break;
						case "portRight": //keep
							portRight=_val;
							for (var i=0;i<array_length(portRight);i++) portRight[i]=asset_get_index(portRight[i]);
							portOverride=true;
							break;
						case "goto": //keep
							if is_real(_val) diag=_val;
							else if string_pos("dev",_val)==0||isDev||(isTest&&global.devSkips)
							{
								for (var i=0;i<array_length(command);i++) if command[i]=="#"+_val
								{
									diag=i;
									break;
								}
							}
							break;
						//mechanics
						case "rumble":
							rumbleStart(_val);
							break;
						case "parachuteAdd":
							var _p=instance_create_depth(_obj.x,_obj.y,_obj.depth+1,oParachute);
							_p.target=_obj;
							eventAddObject(oParachute,room,_obj.object_index,0,"people",[]);
							break;
						case "parachuteRemove":
							if instance_exists(oParachute) with oParachute if target==_obj target=-1;
							eventRemove(oParachute,room,_obj.object_index,0,"people",[]);
							break;
						default:
							variable_instance_set(_obj,_name,_val);
							break;
					}
			}
		}
		else switch (command[diag])
		{
			case "lie": //keep
				global.lies++;
				diag++;
				break;
			//npc
			case "idleText": //keep
				if is_string(command[diag+1]) var _convo=randomizeIdleText(textLoad(command[diag+1]),getObject("npc"+characterFirstLetterUpper));
				else var _convo=randomizeIdleText(command[diag+1],getObject("npc"+characterFirstLetterUpper));
				text=_convo;
				command=_convo;
				diag=0;
				break;
			case "skip": //keep
				skip=true;
				diag++;
				break;
			default: 
				var _word=command[diag];
				diag++;
				if string_char_at(_word,1)=="#" break;
				return _word;
		}
	}
}

function commandProcessOld(command){
	while true
	{
		if diag>=array_length(command)||is_undefined(command[diag])||command[diag]=="end"
		{
			return "stopDiag";
		}
		else if is_real(command[diag])
		{
			alarm[0]=command[diag];
			wait=true;
			diag++;
			return ""
		}
		else if variable_struct_exists(global.characters,command[diag])
		{
			character=command[diag];
			if diag+1<array_length(command)&&is_real(command[diag+1]) 
			{
				portInd=command[diag+1];
				diag++;
			}
			diag++;
			setCharacterDiag();
			//no break since this isn't inside the switch
		}
		else if string_pos("if",command[diag])==1
		{
			var _num=string_digits(command[diag]);
			if diagCondition(command[diag+1])while command[diag]!="#true"+_num diag++;
			else while command[diag]!="#false"+_num diag++;
			diag++;
		}
		else if string_pos("question",command[diag])==1
		{
			questionNum=int64(string_digits(command[diag]));
			question=true;
			questionChoice=0;
			diag+=2;
			return command[diag-1];
		}
		else switch (command[diag])
		{
			case "ply":
				resetCharacterTestVars();
				diag++;
				break;
			case "rumble":
				rumbleStart(command[diag+1]);
				diag+=2;
				break;
			case "var":
				var _obj=string_copy(command[diag+1],1,string_pos(".",command[diag+1])-1);
				var _name=string_replace(command[diag+1],_obj+".","");
				_obj=getObject(_obj);
				variable_instance_set(_obj,_name,command[diag+2]);
				diag+=3;
				break;
			case "globalVar":
				variable_global_set(command[diag+1],command[diag+2]);
				diag+=3;
				break;
			case "addVar":
				var _obj=string_copy(command[diag+1],1,string_pos(".",command[diag+1])-1);
				var _name=string_replace(command[diag+1],_obj+".","");
				_obj=getObject(_obj);
				var _val=command[diag+2];
				var _ptr=variable_instance_get(_obj,_name)
				with _obj
				{
					if ds_exists(_ptr,ds_type_list) ds_list_add(_ptr,_val) //this is a hacky method that won't work if an object has multiple different data structures
					else if ds_exists(_ptr,ds_type_queue) ds_queue_enqueue(_ptr,_val) //but it's fine for limited uses
				}
				diag+=3;
				break;
			case "script":
				var _scr=asset_get_index(command[diag+1]);
				if diag+2<array_length(command)&&is_array(command[diag+2])
				{
					script_execute_ext(_scr,command[diag+2]);
					diag++;
				}
				else script_execute(_scr);
				diag+=2;
				break;
			//text
			case "cutscene":
				cancelCutsceneDelay(command[diag+1]);
				text=textLoad(command[diag+1]);
				diag=0;
				command=text;
				break;
			case "cutsceneCondition":
			case "cutsceneDelay":
			case "cutsceneDelayRoom":
				var _cd=instance_create_layer(0,0,"above",oCutsceneDelay);
				_cd.key=command[diag+1];
				_cd.originalKey=command[diag+1];
				if command[diag]=="cutsceneDelayRoom" 
				{
					_cd.startroom=room;
					_cd.persistent=false;
				}
				else _cd.startroom="any";
				_cd.mode=(command[diag]=="cutsceneCondition");
				if _cd.mode&&asset_get_index(command[diag+2])>-1
				{
					_cd.startroom=asset_get_index(command[diag+2]);
					diag++;
					_cd.persistent=false;
				}
				_cd.delay=command[diag+2];
				_cd.delayCount=command[diag+2];
				var _arr=[];
				if diag+3<array_length(command)&&is_array(command[diag+3])
				{
					_cd.args=command[diag+3];
					_arr=_cd.args;
					diag++;
				}
				if diag+3<array_length(command)&&script_exists(asset_get_index(command[diag+3]))
				{
					_cd.scr=asset_get_index(command[diag+3]);
					diag++;
				}
				eventAddObject(oCutsceneDelay,_cd.startroom,_cd.key,_cd.delay,"above",_arr);
				diag+=3;
				if _cd.startroom!="any"&&_cd.startroom!=room instance_destroy(_cd);
				break;
			case "cutsceneDelayCancel":
				cancelCutsceneDelay(command[diag+1]);
				diag+=2;
				break;
			case "font":
				font=asset_get_index(command[diag+1]);
				diag+=2;
				fontOverride=true;
				break;
			case "portLeft":
				portLeft=command[diag+1];
				for (var i=0;i<array_length(portLeft);i++) portLeft[i]=asset_get_index(portLeft[i]);
				diag+=2;
				portOverride=true;
				break;
			case "portRight":
				portRight=command[diag+1];
				for (var i=0;i<array_length(portRight);i++) portRight[i]=asset_get_index(portRight[i]);
				diag+=2;
				portOverride=true;
				break;
			case "roomChange":
				roomChange(command[diag+1],command[diag+2],asset_get_index(command[diag+3]),command[diag+4],command[diag+5],command[diag+6],command[diag+7]);
				diag+=8;
				break;
			case "lie":
				global.lies++;
				diag++;
				break;
			//mechanics
			case "parachuteAdd":
				var _obj=getObject(command[diag+1]);
				var _p=instance_create_depth(_obj.x,_obj.y,_obj.depth+1,oParachute);
				_p.target=_obj;
				eventAddObject(oParachute,room,_obj.object_index,0,"people",[]);
				diag+=2;
				break;
			case "parachuteRemove":
				var _obj=getObject(command[diag+1]);
				if instance_exists(oParachute) with oParachute if target==_obj target=-1;
				eventRemove(oParachute,room,_obj.object_index,0,"people",[]);
				diag+=2;
				break;
			//npc
			case "idleText":
				if is_string(command[diag+1]) var _convo=randomizeIdleText(textLoad(command[diag+1]),getObject("npc"+characterFirstLetterUpper));
				else var _convo=randomizeIdleText(command[diag+1],getObject("npc"+characterFirstLetterUpper));
				text=_convo;
				command=_convo;
				diag=0;
				break;
			case "alpha":
				var _obj=getObject(command[diag+1]);
				if diag+3<array_length(command)&&is_real(command[diag+3])
				{
					var _e=instance_create_depth(0,0,0,oEffectHelper);
					_e.obj=_obj;
					_e.alphaTo=command[diag+2];
					_e.alphaStep=command[diag+3];
					diag+=4;
				}
				else
				{
					_obj.image_alpha=command[diag+2];
					diag+=3;
				}
				break;
			case "facePlayer":
				var _obj=getObject(command[diag+1]);
				_obj.facePlayer=true;
				diag+=2;
				break;
			case "!facePlayer":
				var _obj=getObject(command[diag+1]);
				_obj.facePlayer=false;
				diag+=2;
				break;
			case "xscale":
				var _obj=getObject(command[diag+1]);
				if diag+3<array_length(command)&&is_real(command[diag+3])
				{
					var _e=instance_create_depth(0,0,0,oEffectHelper);
					_e.obj=_obj;
					_e.xscaleTo=command[diag+2];
					_e.xscaleStep=command[diag+3];
					diag+=4;
				}
				else
				{
					_obj.image_xscale=command[diag+2];
					diag+=3;
				}
				break;
			case "yscale":
				var _obj=getObject(command[diag+1]);
				if diag+3<array_length(command)&&is_real(command[diag+3])
				{
					var _e=instance_create_depth(0,0,0,oEffectHelper);
					_e.obj=_obj;
					_e.yscaleTo=command[diag+2];
					_e.yscaleStep=command[diag+3];
					diag+=4;
				}
				else
				{
					_obj.image_yscale=command[diag+2];
					diag+=3;
				}
				break;
			case "name":
				global.characterLocations[? command[diag+1]][3]=command[diag+2];
				diag+=3;
				break;
			case "skip":
				skip=true;
				diag++;
				break;
			case "resetText":
				getObject(command[diag+1]).text=[];
				break;
			case "setText":
				if is_array(command[diag+2]) getObject(command[diag+1]).text=command[diag+2];
				else getObject(command[diag+1]).text=textLoad(command[diag+2]);
				break;
			case "setIdleText":
				var _obj=getObject(command[diag+1]);
				with _obj
				{
					var _l=global.characterLocations[? npcKey][4];
					var _n=capitalizeFirstLetter(npcKey);
					if variable_struct_exists(global.langScript,_l+_n+"Idle") text=textLoad(_l+_n+"Idle");
				}
				diag+=2;
				break;
			case "port":
				portInd=command[diag+1];
				diag+=2;
				break;
			case "jump":
				var _obj=getObject(command[diag+1]);
				_obj.jump=1;
				diag+=2;
			case "impulse":
				impulse(command[diag+2],command[diag+3],getObject(command[diag+1]));
				diag+=4;
			case "pathfinding":
				var _obj=getObject(command[diag+1]);
				pathfindingStart(_obj,command[diag+1]);
				diag+=3;
				break;
			case "setRoom":
				setNPCRoom(command[diag+1],command[diag+2],command[diag+3]);
				diag+=4;
				break;
			//camera
			case "zoom":
				global.zoomTo=command[diag+1];
				global.zoomStep=command[diag+2];
				oCamera.alarm[0]=1;
				diag+=3;
				break;
			case "camSpd":
				oCamera.camSpd=command[diag+1];
				diag+=2;
				break;
			case "camSetInstant":
			case "camSet":
				oCamera.followMode=0;
				if is_string(command[diag+1])&&instance_exists(getObject(command[diag+1])) oCamera.xTo=getObject(command[diag+1]).x;
				else if command[diag+1]!="x" oCamera.xTo=command[diag+1];
				if is_string(command[diag+2])&&instance_exists(getObject(command[diag+2])) oCamera.yTo=getObject(command[diag+2]).y;
				else if command[diag+2]!="y" oCamera.yTo=command[diag+2];
				if command[diag]=="camSetInstant"
				{
					oCamera.x=oCamera.xTo;
					oCamera.y=oCamera.yTo;
				}
				diag+=3;
				break;
			case "camFollow":
				oCamera.followMode=1;
				oCamera.followObj=getObject(command[diag+1]);
				diag+=2;
				break;
			case "camPath":
				oCamera.followMode=2;
				oCamera.followObj=command[diag+1];
				oCamera.followPathProgress=0;
				diag+=2;
				break;
			case "camReset":
				with oCamera
				{
					camSpd=originalSpd;
					if instance_exists(oPlayerCam)
					{
						followMode=1;
						followObj=oPlayerCam;
					}
					else
					{
						followMode=0;
						xTo=room_width/2;
						yTo=room_height/2;
					}
				}
				diag++;
				break;
			case "shake":
				oCamera.shakeX=command[diag+1];
				oCamera.shakeY=command[diag+2];
				oCamera.shakeTime=command[diag+3];
				diag+=4;
				break;
			//data
			case "addItem":
				var _item=command[diag+1];
				processItem(_item);
				diag+=2;
				if command[diag]=="text"
				{
					diag++;
					return textLoad("itemText")[$ _item][2];
				}
				if instance_exists(oGrapple) with oGrapple event_user(0); //set upgrade variables
				break
			case "removeItem":
				var _item=command[diag+1];
				diag+=2;
				var _rep=1;
				if is_real(command[diag])
				{
					_rep=command[diag];
					diag++;
				}
				var _pos=ds_list_find_index(global.playerItems,_item);
				if global.playerItems[|i+1]-_rep<=0 repeat 2 ds_list_delete(global.playerItems,_pos);
				else global.playerItems[|i+1]-=_rep;
				break;
			case "addData":
				if !hasData(command[diag+1]) ds_list_add(global.data,command[diag+1]);
				diag+=2;
				break;
			case "removeData":
				if ds_list_find_index(global.data,command[diag+1])>-1 ds_list_delete(global.data,ds_list_find_index(global.data,command[diag+1]));
				else show_debug_message("Error: Trying to remove "+command[diag+1]+" from global.data.");
				diag+=2;
				break;
			//animation
			case "speed":
				getObject(command[diag+1]).image_speed=command[diag+2];
				diag+=3;
				break;
			case "startAnimation":
				getObject(command[diag+1]).currentAnimation=command[diag+2];
				getObject(command[diag+1]).animating=true;
				diag+=3;
				break;
			case "stopAnimation":
				getObject(command[diag+1]).currentAnimation="";
				getObject(command[diag+1]).animating=true;
				diag+=2;
				break;
			case "sequence":
				var _seqID=command[diag+1];
				var _seqX=command[diag+2];
				var _seqY=command[diag+3];
				diag+=4;
				if diag<array_length(command)&&layer_exists(layer_get_id(command[diag]))
				{
					layer_sequence_create(layer_get_id(command[diag]),_seqX,_seqY,_seqID);
					diag++;
				}
				else layer_sequence_create(layer_get_id("aboveAsset"),_seqX,_seqY,_seqID);
				break;
			//objects
			case "userEvent":
				var _obj=getObject(command[diag+1]);
				var _num=command[diag+2];
				with _obj event_user(_num);
				diag+=3;
				break;
			case "alarm":
				getObject(command[diag+1]).alarm[command[diag+2]]=command[diag+3];
				diag+=4;
				break;
			case "snapNPC":
				if asset_get_index(command[diag+1])==-1 command[diag+1]="npc"+capitalizeFirstLetter(command[diag+1]);
				if !instance_exists(asset_get_index(command[diag+1])) var _obj=instance_create_layer(0,0,"people",asset_get_index(command[diag+1]));
				else _obj=getObject(command[diag+1]);
				with _obj
				{
					pathfinding=false;
					move=0;
					jump=0;
					positionNpc(1);
				}
				diag+=2;
				break;
			case "createNPC":
				if asset_get_index(command[diag+1])==-1 command[diag+1]="npc"+capitalizeFirstLetter(command[diag+1]);
				lastObj=instance_create_layer(0,0,"people",asset_get_index(command[diag+1]));
				diag+=2;
				break;
			case "create":
				lastObj=instance_create_depth(tCoord(command[diag+1]),tCoord(command[diag+2]),command[diag+3],asset_get_index(command[diag+4]));
				diag+=5;
				break;
			case "createLayer":
				lastObj=instance_create_layer(tCoord(command[diag+1]),tCoord(command[diag+2]),layer_get_id(command[diag+3]),asset_get_index(command[diag+4]));
				diag+=5;
				break;
			case "destroy":
				instance_destroy(getObject(command[diag+1]));
				diag+=2;
				break;
			case "destroyPlace":
				if place_meeting(command[diag+1],command[diag+2],asset_get_index(command[diag+3])) instance_destroy(instance_place(command[diag+1],command[diag+2],asset_get_index(command[diag+3])));
				diag+=4;
				break;
			case "index":
				getObject(command[diag+1]).image_index=command[diag+2];
				diag+=3;
				break;
			case "blend":
				getObject(command[diag+1]).image_blend=command[diag+2];
				diag+=3;
				break;
			case "sprite":
				getObject(command[diag+1]).sprite_index=asset_get_index(command[diag+2]);
				diag+=3;
				break;
			case "mask":
				getObject(command[diag+1]).mask_index=asset_get_index(command[diag+2]);
				diag+=3;
				break;
			case "persistent":
				getObject(command[diag+1]).persistent=command[diag+2];
				diag+=3;
				break;
			case "x":
				getObject(command[diag+1]).x=command[diag+2];
				diag+=3;
				break;
			case "y":
				getObject(command[diag+1]).x=command[diag+2];
				diag+=3;
				break;
			case "xy":
				getObject(command[diag+1]).x=command[diag+2];
				getObject(command[diag+1]).y=command[diag+3];
				diag+=4;
				break;
			default: 
				var _word=command[diag];
				diag++;
				if string_char_at(_word,1)=="#" break;
				return _word;
		}
	}
}

function pathfindCommandProcess(command){
	var _loop=true;
	while _loop{
		_loop=false;
		if pfInd>=array_length(command)||is_undefined(command[pfInd])||command[pfInd]=="end"
		{
			pathfinding=false;
			jumpCheck=false;
		}
		else if is_real(command[pfInd])
		{
			pfWait=command[pfInd];
			pfInd++;
		}
		else switch (command[pfInd])
		{
			case "xy":
				pfX=command[pfInd+1];
				pfY=command[pfInd+2];
				pfRad=command[pfInd+3];
				pfInd+=4;
				reachedTarget=false;
				break;
			case "jump":
				jump=1;
				pfInd++;
				_loop=true;
				break;
			case "jumpCheck":
				jumpCheck=command[pfInd+1];
				pfInd+=2;
				_loop=true;
				break;
			case "alpha":
				_loop=true;
				if pfInd+2<array_length(command)&&is_real(command[pfInd+2])
				{
					var _e=instance_create_depth(0,0,0,oEffectHelper);
					_e.obj=id;
					_e.alphaTo=command[pfInd+1];
					_e.alphaStep=command[pfInd+2];
					pfInd+=3;
				}
				else
				{
					image_alpha=command[pfInd+1];
					pfInd+=2;
				}
				break;
			case "xscale":
				_loop=true;
				xscale=command[pfInd+1];
				pfInd+=2;
				break;
			case "yscale":
				_loop=true;
				yscale=command[pfInd+1];
				pfInd+=2;
				break;
			case "goto":
				_loop=true;
				if is_real(command[pfInd+1]) pfInd=command[pfInd+1];
				else
				{
					for (var i=0;i<array_length(command);i++) if command[i]=="#"+command[pfInd+1]
					{
						pfInd=i;
						break;
					}
					pfInd++;
				}
				break;
			case "shake":
				oCamera.shakeX=command[pfInd+1];
				oCamera.shakeY=command[pfInd+2];
				oCamera.shakeTime=command[pfInd+3];
				pfInd+=4;
				break;
			case "speed":
				getObject(command[pfInd+1]).image_speed=command[pfInd+2];
				pfInd+=3;
				break;
			case "startAnimation":
				currentAnimation=command[pfInd+2];
				animating=true;
				pfInd+=3;
				break;
			case "stopAnimation":
				currentAnimation="";
				animating=true;
				pfInd+=2;
				break;
			case "pathfinding":
				var _obj=getObject(command[pfInd+1]);
				pfInd+=3;
				pathfindingStart(_obj,command[pfInd-1]);
				 if _obj!=id _loop=true;
				break;
			case "cutscene":
				cancelCutsceneDelay(command[pfInd+1])
				if is_array(command[pfInd+1]) conversation(command[pfInd+1]);
				else conversation(textLoad(command[pfInd+1]));
				pfInd+=2;
				break;
			default: 
				_loop=true;
				pfInd++;
				break;
		}
		
		if !_loop pfInd--; //pfInd increments right before the command is processed
		//the extra pfInd++ for each command is left in to maintain parity with the dialogue parser
	}
}

function processTextVariables(text)
{
	if is_undefined(text) return "";
	if string_pos("{name}",text)>0 text=string_replace(text,"{name}",global.name);
	if string_pos("{NAME}",text)>0 text=string_replace(text,"{NAME}",string_upper(global.name));
	if string_pos("{character}",text)>0 text=string_replace(text,"{character}",string_upper(global.characterNames[global.characterLocations[? character][3]]));
	return text;
}

function getObject(objName)
{
	if objName=="lastObj" return lastObj;
	var _a=asset_get_index(objName);
	if _a==-1 return objName;
	if !instance_exists(_a) return _a;
	return instance_nearest(0,0,_a);
}

function getNpc(objName)
{
	if is_real(objName)
	{
		if instance_exists(objName) objName=objName.object_index;
		objName=object_get_name(objName);
	}
	return string_lower(string_replace(objName,"npc",""));
}

function tCoord(coord){
	if is_string(coord)
	{
		if string_pos(coord,"dieX")>0 return global.dieX;
		if string_pos(coord,"dieY")>0 return global.dieY;
	}
	return coord;
}