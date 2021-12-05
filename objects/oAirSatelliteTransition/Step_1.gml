if global.alive{
	if mode==0{
		direction=(direction+1+(abs(direction-90)>28)*8)%360;
		if place_meeting(x,y,oGrapple)&&oGrapple.followObj=id{
			mode=1;
			if !hasData("satelliteIntro") conversation("air_satelliteIntro");
			buttonFreeze(control.up);
		}
	}
	else if mode==1{
		if direction!=90 direction-=sign(direction-90);
		if ply.state!=moveState.pulling ply.state=moveState.floating;
	}
	
	x=xstart+lengthdir_x(radius,direction);
	y =ystart+lengthdir_y(radius,direction);
	image_angle=(direction-90)
}