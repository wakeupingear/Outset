if global.alive
{
	if !moving
	{
		if touchIsTrigger&&distance_to_object(ply)<12&&roomHasPower()
		{
			if !place_meeting(x,y-1,ply) touch=false;
			else if !touch
			{
				touch=true;
				moving=true;
			}
		}
	}
	else
	{
		if distance_to_object(ply)<12&&place_meeting(x,y-1,ply) 
		{
			plyRelX=ply.x-x;
			plyRelY=ply.y-y;
			touch=true;
		}
		else touch=false;
		x+=moveDir*xSpd;
		y+=moveDir*ySpd;
	
		if (moveDir==1&&x>=max(xstart,xTarget)&&y>=max(ystart,yTarget))||(moveDir==-1&&x<=min(xstart,xTarget)&&y<=min(ystart,yTarget))
		{
			if moveDir==1
			{
				x=max(xstart,xTarget);
				y=max(ystart,yTarget);
			}
			else 
			{
				x=min(xstart,xTarget);
				y=min(ystart,yTarget);
			}
			moveDir*=-1;
			moving=false;
		}
		
		platformMovePlayer();
	}
}