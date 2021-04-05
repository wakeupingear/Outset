if moving&&global.alive
{
	if distance_to_object(ply)<12&&place_meeting(x,y-1,ply) 
	{
		plyRelX=ply.x-x;
		plyRelY=ply.y-y;
		touch=true;
	}
	else touch=false;
	ang+=spd;
	while ang<0 ang+=360;
	while ang>=360 ang-=360;
	x=round(centerX+lengthdir_x(dist,ang));
	y=round(centerY+lengthdir_y(dist,ang));
	
	platformMovePlayer();
}