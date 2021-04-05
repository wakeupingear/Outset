/// @description Animation
if global.alive{
if moving
{
	if abs(yOff-yTo)<1&&abs(xOff-xTo)<1
	{
		xOff=xTo;
		yOff=yTo;
		moving=false;
	}
	else
	{
		xOff+=median((xTo-xOff)*spd,-maxChange,maxChange);
		yOff+=median((yTo-yOff)*spd,-maxChange,maxChange);
	}
}

for (var i=0;i<2;i++) if barriersPos[i]>0&&barriersPos[i]<1 barriersPos[i]+=0.05;

if alarm[2]==-1&&!ds_queue_empty(lightningQueue) alarm[2]=1;
}
else pauseAlarms(4);