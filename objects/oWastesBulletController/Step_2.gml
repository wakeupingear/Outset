/// @description Animation
if global.alive
{
	if !persistent
	{
		oWastesClouds.xSpd=twerp(TwerpType.in_cubic,1,4,(cloudFadeTime-1-alarm[0])/cloudFadeTime);
		with oWastesClouds image_angle=startAng+(ply.x-camX()-192)/(xLerp*16);
		with oSkyWastes image_angle=(ply.x-camX()-192)/20;
	}
	else if room==rWastes&&ply.state<=moveState.running
	{
		conversation("wastes_bulletSurvive");
		instance_destroy();
	}
}