event_inherited();

xscale=image_xscale;
damage=1;
attacking=true;
enemHitTrigger=-1;
damaged=false;

animation.standing={type: animType.pingPong,startFrame: 0,endFrame:1,frameTime:12};

if !isObj(id,enemWall)&&!isObj(id,boss)
{
	canDropSoul=true;
	soulNum=2;
	flashTime=90;
	uid="enem"+string(x)+string(y)+room_get_name(room);
	alarm[1]=1;
}