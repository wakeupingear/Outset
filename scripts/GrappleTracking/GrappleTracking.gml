function grapplePositionFollowCoords(){
	followXOff=x-followObj.x;
	followYOff=y-followObj.y;
}

function grappleSetTracking(_x,_y){
	if place_meeting(x,y,npc)
			{
				followObj=instance_place(x,y,npc);
				grapplePositionFollowCoords();
			}
			else if place_meeting(x,y,grappleHit)
			{
				followObj=instance_place(x,y,grappleHit);
				grapplePositionFollowCoords();
			}
			x=_x;
			y=_y;
			if place_meeting(x,y,oPlatform)
			{
				followObj=instance_place(x,y,oPlatform);
				grapplePositionFollowCoords();
			}
			else if groundCollision(x,y)
			{
				if grappleMode==grappleState.arc
				{
					while groundCollision(x,y) y--;
					y+=distIntoWall;
				}
				else
				{
					while groundCollision(x,y)
					{
						x-=xDir;
						y-=yDir;
					}
					x+=distIntoWall*xDir;
					y+=distIntoWall*yDir;
				}
			}
}