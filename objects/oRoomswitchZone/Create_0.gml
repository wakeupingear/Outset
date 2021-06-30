event_inherited();

xZone=-1;
xTargets=[];
yZone=-1;
yTargets=[];

setEndPos=function(arr,cord,plyCord,targetArr,ind){
	if is_array(arr)
	{
		if ind>0 cord=targetArr[ind-1];
		var _range=targetArr[ind]-cord;
		return arr[0]+round((arr[1]-arr[0])*(plyCord-cord)/_range);
	}
	return arr
}

loadTargets=function(struct,ind){
	target_x=setEndPos(struct.target_x,x,ply.x,xZone,ind);
	target_y=setEndPos(struct.target_y,y,ply.y,yZone,ind);
	if variable_struct_exists(struct,"targetroom") targetroom=struct.targetroom;
	if variable_struct_exists(struct,"xscale") xscale=struct.xscale;
}

setTargets=function(){
	var i=0;
	var _type=is_array(yZone);
	if !_type 
	{
		while ply.x>xZone[i] i++;
		loadTargets(xTargets[i],i);
	}
	else
	{
		while ply.y>yZone[i] i++;
		loadTargets(yTargets[i],i);
	}
	
}