/// @description set player variables
if instance_exists(ply)
{
	if plyState==moveState.ladder ply.state=moveState.ladder;
	else if plyState==moveState.conveyor&&instance_exists(oGrapple)
	{
		if ymove==-1
		{
			with oGrapple 
			{
				state=1;
				xDir=ply.xscale;
				while !place_meeting(x,y,oConveyor) x+=xDir;
				step();
			}
		}
		else
		{
			with oGrapple 
			{
				state=1;
				yDir=-1;
				while !place_meeting(x,y,oConveyor) y--;
				step();
			}
		}
	}
	ply.move=move;
	var _vsp=0;
	if sign(ymove)==-1
	{
		if ymove==-1 _vsp=-6;
		else _vsp=ymove;
	}
	else if sign(ymove)==1
	{
		if ymove==1 _vsp=4;
		else _vsp=ymove;
	}
	impulse(0,_vsp,ply);
	if xscale!=0 ply.xscale=xscale;
	if instance_exists(oPlayerCam) 
	{
		with oPlayerCam
		{
			oPlayerCam.image_xscale=ply.xscale;
			oPlayerCam.horiAmp=oPlayerCam.horiAmpMax*ply.xscale;
			setPos(ply.x,ply.y);
		}
		with oCamera 
		{
			if xTo==x&&yTo==y //make sure that it isn't set to a specific point
			{
				followObj=instance_nearest(x,y,oPlayerCam);
				followMode=1;
				setFollowTo(true);
				x=xTo;
				y=yTo;
				findCameraPosition(true);
			}
			
			if place_meeting(x,y,oCameraHit)
			{
				var _p=instance_place(x,y,oCameraHit);
				x=_p.camXPos;
				y=_p.camYPos;
				xTo=x;
				yTo=y;
			}
		}
	}
}