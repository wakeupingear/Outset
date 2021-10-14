camera_destroy(global.cam);
global.cam=camera_create();

x=global.plyX;
y=global.plyY;
var _vm= matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var _pm = matrix_build_projection_ortho(384*global.zoomLevel,216*global.zoomLevel,1,10000);
camera_set_view_size(global.cam,384*global.zoomLevel,216*global.zoomLevel);
camera_set_view_mat(global.cam,_vm);
camera_set_proj_mat(global.cam,_pm);

view_camera[0]=global.cam;
followMode=0; //0= don't track, 1=object, 2=path
followObj=noone;
followPath=-1;
pathSpd=2;
pathEnd=path_action_stop;
pathAbsolute=false;

if global.zoomTo!=global.zoomLevel alarm[0]=1;

positions=global.rooms[$ room_get_name(room)].camera;
soulPositions=global.rooms[$ room_get_name(room)].soulCamera;

camSpd=0.1;
originalSpd=camSpd;
maxChange=9;
xTo=x;
yTo=y;

jumpHeight=45;

shakeTime=0;
shakeToggle=false;
shakeX=0;
shakeY=0;

shakeRandX=0;
shakeRandY=0;
clampCam = function(){
	x=clamp(x,192,room_width-192);
	y=clamp(y,108,room_height-108);
	xTo=clamp(xTo,192,room_width-192);
	yTo=clamp(yTo,108,room_height-108);
}

setFollowTo=function(autoStill){
	if !instance_exists(followObj)
	{
		followMode=0;
		return false;
	}
	else if followObj.object_index==oPlayerCam||object_is_ancestor(followObj.object_index,oPhysicsObj)
	{
		xTo=followObj.x;
		//if ply.state>=moveState.jumping||true
		{
			if autoStill||(yTo-followObj.y-jumpHeight>-60&&ply.state<moveState.jumping&&ply.vsp==0) yTo+=followObj.y+jumpHeight-(yTo+60);
			else if followObj.y-yTo>50 yTo+=followObj.y+1-(yTo+50);
			else if yTo-followObj.y>30 yTo+=followObj.y-(yTo-30);
		}
		/*else
		{
			if followObj.y-yTo>30||yTo-followObj.y>30 yTo+=followObj.y-yTo;	
		}*/
	}
	else
	{
		xTo=followObj.x;
		yTo=followObj.y;
	}
	return true;
}

setRoomCamera=function(arr){
	if is_array(arr[4])
	{
		xTo=lerp(arr[4][0],followObj.x,arr[4][1]);
	}
	else if !is_string(arr[4]) xTo=arr[4];
	if is_array(arr[5])
	{
		yTo=lerp(arr[5][0],followObj.y,arr[5][1]);
	}
	else if !is_string(arr[5]) yTo=arr[5];
}

clampCam();

cameraCondition=function(cond){
	if cond==-1 return true;
	switch (cond)
	{
		case "notdonEraPresent": return (global.notdonEra>=notdonEras.present);
		case "notdonEraPastPro3": return (global.notdonEra>=notdonEras.pro3);
		case "notdonEraLaunchExists": return (global.notdonEra>=notdonEras.pro1);
		default: return false;
	}
}

findCameraPosition=function(snap){
	if !instance_exists(followObj) exit;
	var _x=followObj.x;
	if followObj.object_index==oPlayerCam&&instance_exists(ply) _x=ply.x;
	else _x=followObj.x;
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
	if snap
	{
		x=xTo;
		y=yTo;
		var _vm=matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
		camera_set_view_mat(global.cam,_vm);
	}
}