event_inherited();

canDropSoul=false;
attacking=false;
activationType=0;

var _n=object_get_name(object_index);
enemActive=false;
startCutscene=[]; //intro cutscene
startDelay=30; //delay before intro cutscene
startCutsceneTriggered=false; //whether the boss has been initially triggered
dieCutscene=["$addData",_n,"$"+_n+".destroy"]; //cutscene when dying
dieDelay=60; //delay between final hit and death

deadReturn=-1; //function to run when the room is returned to

checkActive=function(){
	var _active=false
	switch activationType
	{
		case 0:
			_active=true;
			break;
	}
	if _active
	{
		startCutsceneTriggered=true;
		alarm[1]=startDelay;
	}
}

if hasData(_n) //boss already defeated
{
	myHealth=0; //die
	alarm[3]=1; //trigger dead return
	visible=false; //hide
}