image_speed=0;
animation=new Animation();
animation.standing=-1;
animation.opening={type: animType.oneOff,startFrame:0,endFrame:7,frameTime:1};
animation.closing={type: animType.oneOff,startFrame:7,endFrame:0,frameTime:1};

mode=0;
spd=2;
up="1";
down="1";

check=4;

enter=function(dir){
	mode=dir;
	setAnimation("closing",animation);
	with oElevator 
	{
		alarm[0]=-1;
		alarm[1]=-1;
	}
	alarm[0]=1;
	ply.state=moveState.floating;
}

eject=function(){
	ply.state=moveState.falling;
	setAnimation("opening",animation);
	alarm[1]=1;
}