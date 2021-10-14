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

var _x=50+irandom_range(-10,10);
var _y=yOff+156+irandom_range(-5,5);
particle(_x,y+170,depth,sDeathCircle,0,{
	isBG: true,
	vsp: 1,
	alpha:1.5,
	fade:0.05,
	xLerp: xLerp,
	yLerp: yLerp,
	xOff: xOff+_x,
	yOff: _y,
	blend: c_soulBlue,
	xscale:0.02,
	yscale:0.02,
	xscaleSpd:0.003,
	yscaleSpd:0.003,
});
particle(_x,y+170,depth,sDeathCircle,0,{
	isBG: true,
	vsp: 1,
	alpha:1.5,
	fade:0.05,
	xLerp: xLerp,
	yLerp: yLerp,
	xOff: xOff-_x,
	yOff: _y,
	blend: c_soulBlue,
	xscale:0.02,
	yscale:0.02,
	xscaleSpd:0.003,
	yscaleSpd:0.003,
});
}
else pauseAlarms(4);