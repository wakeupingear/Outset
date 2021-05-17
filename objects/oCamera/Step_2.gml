if followMode==1
{
	if setFollowTo(false)
	{
		findCameraPosition(false);
	}
}

if x!=xTo||y!=yTo
{
	x+=median((xTo-x)*camSpd,-maxChange,maxChange);
	y+=median((yTo-y)*camSpd,-maxChange,maxChange);
}
if abs(x-xTo)<1 x=xTo;
if abs(y-yTo)<1 y=yTo;
clampCam();

if shakeTime>0
{
	shakeTime--;
	shakeRandX=irandom_range(-shakeX,shakeX);
	shakeRandY=irandom_range(-shakeY,shakeY);
}
else
{
	shakeRandX=0;
	shakeRandY=0;
}
var _vm=matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(global.cam,_vm);
for (var i=0;i<instance_number(oBackground);i++) with instance_find(oBackground,i) event_user(0);