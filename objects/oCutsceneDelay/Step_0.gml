if mode==0
{
	if global.alive{
	//if global.menuOpen delayCount-=0.33;
	//else delayCount--;
	delayCount--;
	}

	if delayCount<=0&&!(force||global.menuOpen)
	{
		event_user(0);
	}
}
else if mode==1
{
	if (!global.menuOpen||merge||force)&&!global.transitioning
	{
		if is_string(delay) //format delay into an array
		{
			explodedDelay=explodeString("&&",delay);
			subArgs=array_create(array_length(explodedDelay))
			if array_length(args)>0&&!is_array(args[0])
			{
				subArgs[0]=args;
			}
			else array_copy(subArgs,0,args,0,array_length(args));
		}
		for (var i=0;i<array_length(explodedDelay);i++)
		{
			if !diagCondition(explodedDelay[i],subArgs[i]) break;
			if i+1==array_length(explodedDelay) event_user(0);
		}
	}
}