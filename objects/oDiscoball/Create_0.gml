image_speed=0;

on=false;
ang=0;
frameTime=0;
spd=-2;
rayNum=14;

onFunction=function(){
	on=true;	
}
offFunction=function(){
	on=false;
	var _stop=true;
	with oDiscoball if on _stop=false;
	if _stop instance_destroy(oDiscoballManager);
}