if followMode==1
{
	if setFollowTo(false)
	{
		var _x=followObj.x;
		if followObj.object_index==oPlayerCam&&instance_exists(ply) var _x=ply.x;
		else var _x=followObj.x;
		if global.alive for (var i=0;i<array_length(positions);i++)
		{
			if _x>positions[i][0]&&followObj.y>positions[i][1]&&_x<positions[i][2]&&followObj.y<positions[i][3]&&cameraCondition(positions[i][6])
			{
				setRoomCamera(positions[i]);
				break;
			}
		}
		else for (var i=0;i<array_length(soulPositions);i++)
		{
			if _x>soulPositions[i][0]&&followObj.y>soulPositions[i][1]&&_x<soulPositions[i][2]&&followObj.y<soulPositions[i][3]&&cameraCondition(positions[i][6])
			{
				setRoomCamera(soulPositions[i]);
				break;
			}
		}
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