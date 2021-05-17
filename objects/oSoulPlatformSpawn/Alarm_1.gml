/// @description Set parents of child branches
//setSoulParent();
var _i=layer_get_id("water");
if layer_exists(_i)
{
	var _d=layer_get_depth(_i)+1;
	if instance_exists(oSoulBranch) with oSoulBranch if object_index==oSoulBranch depth=_d;
}

if instance_exists(oSoulBranch) with oSoulBranch
{
	image_xscale=endXS;
	image_yscale=endYS;
}
//x-=10000;
with oSoulPlatformSpawn setAdjacentSoul();
//x+=10000;
if instance_exists(oSoulBranch)
{
	//if !active
	{
		with oSoulBranch //if x<0 //checking x causes problems where not all platforms start retracted
		{
			while x<0 x+=10000;
			image_xscale=startXS;
			image_yscale=startYS;
			if isHit updateColl();
			if autoParent!=-1
			{
				array_push(autoParent.children,id);
			}
		}
	}
	//else 
	{
		if !global.alive startSoulPlatforms();
		/*with oSoulBranch
		{
			if stop!=-1&&array_pos(global.soulButtons,stop)==-1
			{
				stop.platform=id;
				resetSoulChildrenBranches(children);
			}
		}
		if instance_exists(oSoulBranchHit) with oSoulBranchHit if isHit updateColl();*/
	}
}