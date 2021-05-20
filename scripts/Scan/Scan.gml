function scanVars(){
	isAdded=false;
	isScanned=(ds_list_find_index(global.scanList,id)>-1||!hasItem("iSlate"));
	holdTime=30;
	ds_list_add(global.scanObjs,id);
	drawScanEffect=function(){
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,global.scanColor,image_alpha);
	}
	scanFunc=-1;
}

function scanDraw(){
	var _inRange=(global.alive&&!isScanned&&isInRange(x,y));
	if _inRange
	{
		if !isAdded 
		{
			ds_list_add(global.scanInRangeList,id);
			isAdded=true;
		}
		if global.scanObj==id
		{
			if global.inputs[control.down]>=holdTime
			{
				isScanned=true;
				ds_list_add(global.scanList,id);
				save(global.lastFile);
				global.scanObj=-1;
				if scanFunc!=-1 scanFunc();
			}
			else if buttonHold(control.down)<=0 global.scanObj=-1;
		}
		else if global.scanObj==-1&&buttonPressed(control.down)&&place_meeting(x,y,ply) global.scanObj=id;
		drawScanEffect();
	}
	else
	{
		if isAdded 
		{
			ds_list_delete(global.scanInRangeList,ds_list_find_index(global.scanInRangeList,id));
			isAdded=false;
		}
	}
	return _inRange;
}

function activateScanObjs(){
	for (var i=0;i<ds_list_size(global.scanObjs);i++) if instance_exists(global.scanObjs[|i]) with global.scanObjs[|i]
	{
		isScanned=(ds_list_find_index(global.scanList,id)>-1);
	}
}