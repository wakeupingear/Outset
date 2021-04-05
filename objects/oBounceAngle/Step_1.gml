if st==0
{
	if groundCollision(x,y)
	{
		state=moveState.floating;
	}
	st=1;
}
event_inherited();