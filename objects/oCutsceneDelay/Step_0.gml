if mode==0
{
	if global.alive{
	//if global.menuOpen delayCount-=0.33;
	//else delayCount--;
	delayCount--;
	}

	if delayCount<=0&&!global.menuOpen
	{
		event_user(0);
	}
}
else if mode==1
{
	if (!global.menuOpen||merge)&&!global.transitioning
	{
		if diagCondition(delay,args) event_user(0);
	}
}