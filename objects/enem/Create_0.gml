event_inherited();

damage=1;
attacking=true;

animation.standing={type: animType.pingPong,startFrame: 0,endFrame:1,frameTime:12};

if !object_is_ancestor(object_index,enemWall)
{
	canDropSoul=true;
	soulNum=2;
	flashTime=90;
	uid="enem"+string(x)+string(y)+room_get_name(room);
	alarm[1]=1;
}