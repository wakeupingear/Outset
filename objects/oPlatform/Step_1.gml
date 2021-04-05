if !moving
{
	if touchIsTrigger&&distance_to_object(ply)<12
	{
		if !place_meeting(x,y-1,ply) touch=false;
		else if !touch
		{
			touch=true;
			moving=true;
		}
	}
}
else if global.alive
{
	if distance_to_object(ply)<12&&place_meeting(x,y-1,ply) 
	{
		plyRelX=ply.x-x;
		plyRelY=ply.y-y;
		touch=true;
	}
	else touch=false;
	x+=moveDir*(xTarget-xstart)/spd;
	y+=moveDir*(yTarget-ystart)/spd;
	
	platformMovePlayer();
	
	if (x==xstart&&y==ystart)||(x==xTarget&&y==yTarget)
	{
		moveDir*=-1;
		moving=false;
	}
}