

function pathfindingStart(obj,path){
	with obj{
	pfWait=0;
	pfInd=0;
	pathfinding=true;
	pathfindingInterrupt=false;
	if string_contains(path,"_ALWAYSJUMP"){
		alwaysJump=true;
		path=string_replace(path,"_ALWAYSJUMP","");
	}
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
		var _key=path;
		var _coordStart=string_pos("{",path);
		if _coordStart>0
		{
			_key=string_copy(path,0,_coordStart-1);
		}
		moveCommand=pathLoad(_key);
		var _pos=0;
		/*for (var i=0;i<array_length(moveCommand);i++) if is_string(moveCommand[i]&&string_char_at(moveCommand[i],1)=="x"){
			_pos=i;
			break;
		}*/
		if _coordStart>0
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
	var _end=string_pos("{",path);
	path=string_copy(path,_end+1,string_length(path)-_end);
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