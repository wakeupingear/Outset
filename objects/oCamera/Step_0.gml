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
	var _camDist=median(sqrt(sqr(xTo-x)+sqr(yTo-y))*(camSpd+_camSpdExtra),-maxChange,maxChange);
	var _camDir=point_direction(x,y,xTo,yTo);
	y+=lengthdir_y(_camDist,_camDir);
	var _xChange=lengthdir_x(_camDist,_camDir);
	var _collided=false;
	repeat floor(abs(_xChange))
	{
		x+=sign(_xChange);
		 if place_meeting(x,y,oCameraHit)
		 {
			 x=round(x);
			 while place_meeting(x,y,oCameraHit) x-=sign(_xChange);
			 xTo=x;
			 _collided=true;
			 break;
		 }
	}
	if !_collided x+=(abs(_xChange)%1)*sign(_xChange);
	/*var _xChange=median((xTo-x)*(camSpd+_camSpdExtra),-maxChange,maxChange);
	x+=_xChange;
	var _xSign=sign(_xChange);
	while place_meeting(x,y,oCameraHit) x=round(x)-_xSign;
	var _yChange=median((yTo-y)*(camSpd+_camSpdExtra),-maxChange,maxChange);
	y+=_yChange;
	var _ySign=sign(_yChange);
	while place_meeting(x,y,oCameraHit) y=round(y)-_ySign;*/
}
if abs(x-xTo)<1 x=round(xTo);
if abs(y-yTo)<1 y=round(yTo);
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
controller.lastCamX=x-192;
controller.lastCamY=y-108;
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