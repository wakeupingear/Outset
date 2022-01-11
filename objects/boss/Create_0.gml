event_inherited();

canDropSoul=false;
attacking=false;
activationType=1;

var _n=object_get_name(object_index);
enemActive=false;
startCutscene=[]; //intro cutscene
startDelay=30; //delay before intro cutscene
startCutsceneTriggered=false; //whether the boss has been initially triggered
dieCutscene=["$addData",_n,"$"+_n+".destroy"]; //cutscene when dying
dieDelay=60; //delay between final hit and death

deadReturn=-1; //function to run when the room is returned to

if is_undefined(maxHealth) maxHealth=myHealth;
else myHealth=maxHealth;
resetExtra=-1; //extra reset code
resetFunc=function(){ //fucntion to reset
	myHealth=maxHealth;
	startCutsceneTriggered=false;
	enemActive=false;
	if resetExtra!=-1 resetExtra();
}

ai=-1; //ai function

checkActive=function(){
	var _active=false
	switch activationType
	{
		case 1:
			_active=true;
			break;
		case 0:
			_active=false;
			break;
		default:
			_active=(instance_exists(ply)&&distance_to_object(ply)<=abs(activationType));
			break;
	}
	return _active;
}

if hasData(_n) //boss already defeated
{
	myHealth=0; //die
	alarm[3]=1; //trigger dead return
	visible=false; //hide
}