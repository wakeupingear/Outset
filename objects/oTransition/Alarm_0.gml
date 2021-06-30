/// @description set player variables
if instance_exists(ply)
{
	if ladder ply.state=moveState.ladder;
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
		with oCamera if xTo==x&&yTo==y //make sure that it isn't set to a specific point
		{
			followObj=instance_nearest(x,y,oPlayerCam);
			followMode=1;
			setFollowTo(true);
			x=xTo;
			y=yTo;
			findCameraPosition(true);
		}
	}
}