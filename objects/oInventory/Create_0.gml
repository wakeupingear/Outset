image_speed=0;
image_blend=global.hudColorList[global.hudColor];
fade=0;

mode=!hasData("iSlate");
lastMode=mode;
open=true;

surf=-1;
screenSurf=-1;

var _x=camX();
var _y=camY();
x=ply.x-_x;
y=ply.y-_y;
topLeft=[2];
topLeft[0]=lengthdir_x(point_distance(x,y,0,0),point_direction(x,y,0,0));
topLeft[1]=lengthdir_y(point_distance(x,y,0,0),point_direction(x,y,0,0));
topRight=[2];
topRight[0]=lengthdir_x(point_distance(x,y,384,0),point_direction(x,y,384,0));
topRight[1]=lengthdir_y(point_distance(x,y,384,0),point_direction(x,y,384,0));
botLeft=[2];
botLeft[0]=lengthdir_x(point_distance(x,y,0,216),point_direction(x,y,0,216));
botLeft[1]=lengthdir_y(point_distance(x,y,0,216),point_direction(x,y,0,216));
botRight=[2];
botRight[0]=lengthdir_x(point_distance(x,y,384,216),point_direction(x,y,384,216));
botRight[1]=lengthdir_y(point_distance(x,y,384,216),point_direction(x,y,384,216));
xx=x;
yy=y;