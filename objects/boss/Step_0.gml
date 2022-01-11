/// @description AI
if global.alive&&!instance_exists(oTextbox){
if enemActive
{
	if ai!=-1 ai();
}
else if !startCutsceneTriggered&&myHealth>0
{
	if checkActive()
	{
		startCutsceneTriggered=true;
		alarm[1]=startDelay;
	}
}
}

if !global.alive pauseAlarms(2);