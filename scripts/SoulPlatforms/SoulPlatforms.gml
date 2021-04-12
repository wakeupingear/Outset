// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setAdjacentSoul(){
	//var _l=ds_list_create()
	//show_message(instance_place_list(xstart-1,ystart,oSoulBranch,_l,false)+instance_place_list(xstart+1,ystart,oSoulBranch,_l,false)+instance_place_list(xstart,ystart-1,oSoulBranch,_l,false)+instance_place_list(xstart,ystart+1,oSoulBranch,_l,false))
	//var _ind=0;
	//show_message(place_meeting(xstart,ystart,oSoulButton))
	while place_meeting(xstart-1,ystart,oSoulBranch)
	{
		var _i=instance_place(xstart-1,ystart,oSoulBranch);
		_i.x-=10000;
		if _i.autoParent!=-1 continue;
		_i.parentPlat=id;
		array_push(children,_i);
		with _i setAdjacentSoul();
	}
	while place_meeting(xstart+1,ystart,oSoulBranch)
	{
		var _i=instance_place(xstart+1,ystart,oSoulBranch);
		_i.x-=10000;
		if _i.autoParent!=-1 continue;
		_i.parentPlat=id;
		array_push(children,_i);
		with _i setAdjacentSoul();
	}
	while place_meeting(xstart,ystart-1,oSoulButton) //button takes priority
	{
		var _i=instance_place(xstart,ystart-1,oSoulButton);
		_i.x-=10000;
		if _i.autoParent!=-1 continue;
		_i.parentPlat=id;
		array_push(children,_i);
	}
	while place_meeting(xstart,ystart-1,oSoulBranch)
	{
		var _i=instance_place(xstart,ystart-1,oSoulBranch);
		_i.x-=10000;
		if _i.autoParent!=-1 continue;
		_i.parentPlat=id;
		array_push(children,_i);
		with _i setAdjacentSoul();
	}
	while place_meeting(xstart,ystart+1,oSoulBranch)
	{
		var _i=instance_place(xstart,ystart+1,oSoulBranch);
		_i.x-=10000;
		if _i.autoParent!=-1 continue;
		_i.parentPlat=id;
		array_push(children,_i);
		with _i setAdjacentSoul();
	}
}

function activateSoulChildren(tree){
	for (var i=0;i<array_length(tree);i++)
	{
		tree[i].active=true;
	}
}

function activateSoulChildrenEnds(tree){
	for (var i=0;i<array_length(tree);i++) if tree[i].object_index!=oSoulBranch&&tree[i].object_index!=oSoulTurret
	{
		tree[i].active=true;
	}
}

function resetSoulChildren(tree){
	for (var i=0;i<array_length(tree);i++) with tree[i]
	{
		active=false;
		image_xscale=startXS;
		image_yscale=startYS;
		resetSoulChildren(children);
	}
}

function resetSoulChildrenBranches(tree){
	for (var i=0;i<array_length(tree);i++) 
	{
		if tree[i].object_index==oSoulBranch with tree[i]
		{
			active=false;
			image_xscale=startXS;
			image_yscale=startYS;
			resetSoulChildren(children);
		}
	}
}

function deactivateSoulParent(parent,parentTree){
	var _active=false;
	with parent{
		for (var i=0;i<array_length(parentTree);i++)
		{
			if (parentTree[i].image_xscale!=parentTree[i].startXS||parentTree[i].image_yscale!=parentTree[i].startYS) 
			{
				_active=true;
				break;
			}
		}
		active=_active;
	}
}

function startSoulPlatforms(){
	with oSoulBranch 
	{
		if (image_xscale!=startXS||image_yscale!=startYS) 
		{
			active=true;
			if (image_xscale==endXS&&image_yscale==endYS)
			{
				activateSoulChildrenEnds(children);
			}
			if stop!=-1&&instance_exists(stop) stop.image_index=0;
		}
	}
	with oSoulPlatformSpawn alarm[0]=1;
}