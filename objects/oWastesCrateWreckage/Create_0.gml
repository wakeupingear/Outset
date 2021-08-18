event_inherited();

setPosition=function(){
	if hasData("wWare")==0 y=-1000;
	else
	{
		with oWastesCrate if x<1036&&x>752 
		{
			destroyObjs();
			instance_destroy(id,false);
		}
		y=ystart;
	}
}