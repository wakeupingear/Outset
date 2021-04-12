image_speed=0;
image_blend=global.hudColorList[global.hudColor];
alarm[0]=60;
fade=0;
open=false;
screenSurf=-1;

text=textLoad("titleText");
titleAlpha=0;
textAlpha=0;

surf=-1;
topLeft=[lengthdir_x(point_distance(192,108,0,0),point_direction(192,108,0,0)),
lengthdir_y(point_distance(192,108,0,0),point_direction(192,108,0,0))];
botRight=[lengthdir_x(point_distance(192,108,384,216),point_direction(192,108,384,216)),
lengthdir_y(point_distance(192,108,384,216),point_direction(192,108,384,216))];
blurFunc=function(){
	draw_sprite(sprite_index,image_index,192,108);
	show_debug_message(topLeft)
	show_debug_message(botRight)
}

numOfFiles=0;
while file_exists("file"+string(numOfFiles)+".ini") numOfFiles++;
fileData={};
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