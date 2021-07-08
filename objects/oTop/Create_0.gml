riding=0;
spd=5;
vsp=0;
vspMax=6;
wallclimb=false; //animation
touch=false;

state=moveState.standing;
setCollision();

eject=function(die){
	persistent=false;
	if buttonPressed(control.jump) ply.state=moveState.jumping;
	else ply.state=moveState.falling;
	ply.visible=true;
	ply.vsp=round((y-yprevious)*1.5);
	ply.hsp=0;
	if die
	{
		instance_destroy();
	}
	else
	{
		if riding==2 riding=3;
		else
		{
			touch=true;
			image_index=0;
			riding=0;
		}
	}
}

switch room
{
	case rWastesBorder:
		collList=[oWastesBorderDoor];
		break;
	default:
		collList=[];
		break;
}
checkCollision=function(){
	destroyBreakables();
	for (var i=0;i<array_length(collList);i++) if place_meeting(x,y,collList[i])
	{
		var _i=instance_place(x,y,collList[i]);
		switch _i.object_index
		{
			default:
				_i.x=-100;
				shake(1,1,10);
				instance_destroy(_i);
				break;
		}
	}
}