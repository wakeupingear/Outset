function createCamera(){
	if (room_width==384&&room_height==216)||!instance_exists(ply)
	{
		instance_create_depth(192,108,-10001,oCamera);
	}
	else
	{
		var _pc=instance_create_depth(global.plyX,global.plyY,-10000,oPlayerCam);
		var _c=instance_create_depth(global.plyX,global.plyY,-10001,oCamera);
		//check oTransition for other stuff
		if !instance_exists(oTransition) with _c
		{
			followObj=_pc;
			followMode=1;
			setFollowTo(true);
			x=xTo;
			y=yTo;
		}
	}
}