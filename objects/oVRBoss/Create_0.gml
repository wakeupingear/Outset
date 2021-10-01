/// @description Logic
event_inherited();

positions=[
	[160,148],
	[160,55],
	[294,76],
];
phase=-1;
xTo=x;
yTo=y;

if !hasData("oVRBossIntroFinished")
{
	
}
else if myHealth>0 
{
	enemActive=true;
	phase=0;
	x=positions[0][0];
	y=positions[0][1];
	alarm[4]=1;
}

startCutscene="c1_vrBossIntro";
startDelay=2;
myHealth=3;
dieCutscene="c1_vrBossDefeat";

setBlocks=function(){
	if phase>0 with oTileCrack active=false;
	var _oL=layer_get_all_elements(layer_get_id("blocks"+string(min(phase,2))));
	for (var i=0;i<array_length(_oL);i++)
	{
		layer_instance_get_instance(_oL[i]).active=true;
	}
}

enemHitTrigger=function(){
	alarm[4]=1;
}

deadReturn=function(){
	instance_destroy(oCage);
	instance_destroy(oBlockCrack,false);
	oDoorGlow.y=0;
	oVRUnfinishedFire.ySpd=-1;
	shake(1,1,20000);
	phase=2;
	setBlocks();
}