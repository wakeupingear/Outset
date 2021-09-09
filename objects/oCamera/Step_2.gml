maxChange=10;
var _camSpdExtra=0;
if instance_exists(ply)&&ply.state==moveState.floating
{
	_camSpdExtra=0.15;
}
if followMode==1 //obj
{
	if setFollowTo(false)
	{
		findCameraPosition(false);
	}
}
else if followMode==2 //path
{
	if path_index==-1 path_start(followPath,pathSpd,pathEnd,pathAbsolute);
}

if x!=xTo||y!=yTo
{
	x+=median((xTo-x)*(camSpd+_camSpdExtra),-maxChange,maxChange);
	var _xSign=sign(x-xprevious);
	while place_meeting(x,y,oCameraHit) x=round(x)-_xSign;
	y+=median((yTo-y)*(camSpd+_camSpdExtra),-maxChange,maxChange);
	var _ySign=sign(y-yprevious);
	while place_meeting(x,y,oCameraHit) y=round(y)-_ySign;
}
if abs(x-xTo)<1 x=xTo;
if abs(y-yTo)<1 y=yTo;
clampCam();

if shakeTime>0||shakeToggle
{
	if !shakeToggle shakeTime--;
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

//dev
if isTest||isDev
{
	if false&&keyboard_check(vk_control){
		var _dir=mouse_wheel_down()-mouse_wheel_up();
		//global.zoomLevel+=_dir;
		camera_set_view_size(global.cam,384,216);
	}
}