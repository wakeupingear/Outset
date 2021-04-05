function ladderPhysics(){
	if move!=0
	{
		xscale=move;
		x=round(x)+move;
		if groundCollision(x,y)
		{
			if !groundCollision(x,y-maxYChange)&&groundCollision(x-sign(hsp),y+1)
			{
				y-=maxYChange;
				while !groundCollision(x,y+1) y+=0.25;
			}
			else x-=move;
		}
	}
	var _ymove=buttonHold(control.down)-buttonHold(control.up);
	y=round(y+_ymove*2);
	if groundCollision(x,y) 
	{
		if _ymove==0 _ymove=1;
		while groundCollision(x,y) y-=_ymove;
	}
	
	if !place_meeting(x,y,oLadder)
	{
		state=moveState.falling;
		if _ymove==-1 
		{
			vsp=-3.6;
		}
		else if groundCollision(x,y+1) state=moveState.standing;
	}
	
	if jump==1||buttonPressed(control.jump)
	{
		if _ymove==-1 jumpAdd=1;
		physics();
	}
}