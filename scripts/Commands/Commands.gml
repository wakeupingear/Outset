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
							if is_struct(_val) setObjFromStruct(lastObj,_val);
							break;
						case "createLayer":
							lastObj=instance_create_layer(tCoord(_val[0]),tCoord(_val[1]),layer_get_id(_val[2]),asset_get_index(_val[3]));
							//lastObj.depth--; //breaks layer hierarchy
							if is_struct(_val) setObjFromStruct(lastObj,_val);
							break;
						case "popup":
							lastObj=createPopup(_val);
							return "hold";
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
							addItem(_val);
							break;
						case "removeDroppedItem":
							_val[3]=asset_get_index(_val[3]);
							for (var i=0;i<ds_list_size(global.droppedItems);i+=4)
							{
								if global.droppedItems[|i]==_val[0]&&global.droppedItems[|i+1]==_val[1]&&global.droppedItems[|i+2]==_val[2]&&global.droppedItems[|i+3]==_val[3]
								{
									repeat 4 ds_list_delete(global.droppedItems,i);
									if room==_val[3]&&instance_exists(oDroppedItem) for (var k=0;k<instance_number(oDroppedItem);k++)
									{
										var _o=instance_find(oDroppedItem,k);
										if _o.item==_val[0]&&_o.x==_val[1]&&_o.y==_val[2]
										{
											instance_destroy(_o,false);
											break;
										}
									}
									break;
								}
							}
							break;
						case "removeItem":
							if is_array(_val) var _item=_val[0];
							else var _item=_val;
							diag+=2;
							removeItem(_item);
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
						case "projectile":
							projectile(_val[0],_val[1],_val[2],_val[3]);
							break;
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

function pathfindCommandProcess(command){
	var _loop=true;
	jumpCheck=false;
	while _loop{
		_loop=false;
		if pfInd>=array_length(command)||is_undefined(command[pfInd])||command[pfInd]=="end"
		{
			pathfinding=false;
		}
		else if is_real(command[pfInd])
		{
			pfWait=command[pfInd];
			pfInd++;
		}
		else switch (command[pfInd])
		{
			case "xyj":
				jumpCheck=true;
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
			case "cutsceneForce":
				cancelCutsceneDelay(command[pfInd+1]);
				if is_array(command[pfInd+1]) conversation(command[pfInd+1]);
				else conversation(textLoad(command[pfInd+1]));
				pfInd+=2;
				break;
			case "cutscene":
				cancelCutsceneDelay(command[pfInd+1]);
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

function setObjFromStruct(obj,struct){
	var _names=variable_struct_get_names(struct);
	for (var i=0;i<array_length(_names);i++)
	{
		switch (_names[i])
		{
			case "index":
				obj.image_index=struct.index;
				break;
			case "sprite":
				if !is_string(struct.sprite) obj.sprite_index=struct.sprite;
				else obj.sprite_index=asset_get_index(struct.sprite);
				break;
			case "dir":
				obj.direction=struct.dir;
				break;
			case "angle":
				obj.image_angle=struct.angle;
			case "blend":
				obj.image_blend=struct.blend;
				break;
			default:
				variable_instance_set(obj,_names[i],struct[$ _names[i]]);
				break;
		}
	}
}