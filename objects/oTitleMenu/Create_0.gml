image_speed=0;
image_index=7;
image_blend=global.hudColorList[global.hudColor];
alarm[0]=60;
fade=0;
open=false;
screenSurf=-1;

text=textLoad("titleText");
titleAlpha=0;
textAlpha=0;

showHud=true;

surf=-1;
topLeft=[lengthdir_x(point_distance(192,108,0,0),point_direction(192,108,0,0)),
lengthdir_y(point_distance(192,108,0,0),point_direction(192,108,0,0))];
botRight=[lengthdir_x(point_distance(192,108,384,216),point_direction(192,108,384,216)),
lengthdir_y(point_distance(192,108,384,216),point_direction(192,108,384,216))];
blurFunc=function(){
	draw_sprite(sprite_index,1,192,108);
	setTextureBlendmode();
	with oTitleFile draw();
	with oNewFile draw();
	gpu_set_blendmode(bm_normal);
	draw_sprite(sprite_index,image_index,192,108);
}

locations=textLoad("roomNames");
var _num=0;
while file_exists("file"+string(_num)+".ini") _num++;
numOfFiles=0;
if isNewFile
{
	for (var i=0;i<_num;i++) file_delete("file"+string(i)+".ini");
}
else numOfFiles=_num;
fileData={};
filePadding=48;
createFile=function(i,reload){
	load(i);
	fileData[$ string(numOfFiles)]={
		location: locations[$ room_get_name(global.startRoom)],
		maxHealth: global.maxHealth,
		name: global.name
	}
	var _t=instance_create_depth(x,y+i*filePadding,depth-1,oTitleFile)
	_t.name=fileData[$ string(numOfFiles)].name;
	_t.location=fileData[$ string(numOfFiles)].location;
	_t.maxHealth=fileData[$ string(numOfFiles)].maxHealth;
	_t.playtime=global.playtime;
	_t.file=i;
	_t.selected=(i==0);
	if reload load(global.lastFile);
}

for (var i=0;i<numOfFiles;i++)
{
	createFile(i,false);
}
instance_create_depth(x,y+numOfFiles*filePadding,depth-1,oNewFile);
if numOfFiles>0 load(global.lastFile);
global.plyX=0; //reset positions
global.plyY=0;