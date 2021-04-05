image_speed=0;
image_blend=global.hudColorList[global.hudColor];
alarm[0]=60;
fade=0;
open=false;
surf=-1;
screenSurf=-1;

text=textLoad("titleText");
titleAlpha=0;
textAlpha=0;

numOfFiles=0;
while file_exists("file"+string(numOfFiles)+".ini") numOfFiles++;
fileData={}
var _locations=textLoad("roomNames");
for (var i=0;i<numOfFiles;i++)
{
	load(i);
	fileData[$ string(numOfFiles)]={
		location: _locations[$ room_get_name(global.startRoom)],
		maxHealth: global.maxHealth,
		name: global.name
	}
	var _t=instance_create_depth(x-32,y-32+i*48,depth-1,oTitleFile)
	_t.name=fileData[$ string(numOfFiles)].name;
	_t.location=fileData[$ string(numOfFiles)].location;
	_t.maxHealth=fileData[$ string(numOfFiles)].maxHealth;
	_t.file=i;
	_t.selected=(i==0);
}
load(global.lastFile);
global.plyX=0; //reset positions
global.plyY=0;

topLeft=[2];
topLeft[0]=lengthdir_x(point_distance(192,108,0,0),point_direction(192,108,0,0));
topLeft[1]=lengthdir_y(point_distance(192,108,0,0),point_direction(192,108,0,0));
botRight=[2];
botRight[0]=lengthdir_x(point_distance(192,108,384,216),point_direction(192,108,384,216));
botRight[1]=lengthdir_y(point_distance(192,108,384,216),point_direction(192,108,384,216));