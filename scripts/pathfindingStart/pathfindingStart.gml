// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pathfindingStart(obj,path){
	with obj{
	pfWait=0;
	pfInd=0;
	pathfinding=true;
	pathfindingInterrupt=false;
	//text=[]; //this might be a mistake - it was a mistake (overrides idle/default text)
	if string_pos("simpleEnterRoom",path)==1
	{
		moveCommand=pathLoad("simpleEnterRoom");
		moveCommand[1]=scr_getPathfindCoord(path,0);
		moveCommand[2]=scr_getPathfindCoord(path,1);
	}
	else if string_pos("simpleBackAndForth",path)==1
	{
		moveCommand=pathLoad("simpleBackAndForth");
		moveCommand[2]=scr_getPathfindCoord(path,0);
		moveCommand[3]=scr_getPathfindCoord(path,1);
		moveCommand[6]=scr_getPathfindCoord(path,2);
		moveCommand[7]=scr_getPathfindCoord(path,3);
	}
	else if string_pos("simpleTwo",path)==1
	{
		moveCommand=pathLoad("simpleTwo");
		moveCommand[1]=scr_getPathfindCoord(path,0);
		moveCommand[2]=scr_getPathfindCoord(path,1);
		moveCommand[5]=scr_getPathfindCoord(path,2);
		moveCommand[6]=scr_getPathfindCoord(path,3);
	}
	else if string_pos("simple",path)==1
	{
		moveCommand=pathLoad((path=="simple") ? "simple": "simpleAlwaysJump");
		var _pos=array_pos(moveCommand,"xy")
		if string_pos("simple{",path)==1
		{
			moveCommand[_pos+1]=scr_getPathfindCoord(path,0);
			moveCommand[_pos+2]=scr_getPathfindCoord(path,1);
		}
		else
		{
			moveCommand[_pos+1]=global.characterLocations[? npcKey][0];
			moveCommand[_pos+2]=global.characterLocations[? npcKey][1];
		}
	}
	else if !is_array(path) moveCommand=pathLoad(path);
	else moveCommand=path;
	pathfindCommandProcess(moveCommand);
	}
}

function scr_getPathfindCoord(path,num){
	path=string_replace_all(string_replace(string_replace(string_replace(string_replace(path,"simpleTwo{",""),"simpleBackAndForth{",""),"simpleEnterRoom{",""),"simple{","")," ","");
	var _val="";
	var _ind=1;
	repeat num 
	{
		while string_char_at(path,_ind)!="," _ind++;
		_ind++;
	}
	while string_char_at(path,_ind)!=","&&string_char_at(path,_ind)!="}"
	{
		_val+=string_char_at(path,_ind);
		_ind++;
	}
	return int64(_val);
}