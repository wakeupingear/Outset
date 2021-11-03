/// @description Extend
if active
{
	if (image_xscale!=endXS||image_yscale!=endYS)&&(stop==-1||array_pos(global.soulButtons,stop)>-1)
	{
		global.mykoTerrain.render=false;
		image_xscale+=xSpd;
		image_yscale+=ySpd;
		if isHit
		{
			updateColl();
			if place_meeting(x,y,ply)
			{
				var _i=id;
				with ply if groundCollision(x,y) push(sign(_i.xSpd),sign(_i.ySpd));
			}
		}
		if image_xscale==endXS&&image_yscale==endYS 
		{
			for (var i=0;i<array_length(children);i++)
			{
				if children[i].parentPlat==-1 children[i].parentPlat=id;
			}
			if isHit&&!buttonHold(control.down)&&place_meeting(x,y-1,ply) 
			{
				ply.state=moveState.falling;
				ply.vsp=ySpd;
			}
			if object_index==oSoulButton x=x;
			else activateSoulChildren(children);
			/*else 
			{
				stop.image_index=1;
				stop.platform=id;
				activateSoulChildrenEnds(children);
			}*/
		}
	}
}
else
{
	if (image_xscale!=startXS||image_yscale!=startYS)
	{
		global.mykoTerrain.render=false;
		renderTerrain()
		image_xscale-=xSpd;
		image_yscale-=ySpd;
		if isHit updateColl();
		if (image_xscale==startXS&&image_yscale==startYS) 
		{
			if parentPlat!=-1 deactivateSoulParent(parentPlat,parentPlat.children);
		}
	}
}

visible=(image_xscale!=0&&image_yscale!=0);