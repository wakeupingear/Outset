/// @description Move
if global.alive{
if instance_exists(oGrapple)&&oGrapple.yDir==-1&&abs(oGrapple.x-x)<sprite_width/1.7&&oGrapple.grappleTime==4&&!hasData("oVRBossChaseIntro")
{
	if x==xstart x=197;
	else x=xstart;
	coll.x=x;
}
}