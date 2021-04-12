topLeft[0]=lengthdir_x(point_distance(ply.x-camX(),ply.y-camY(),0,0),point_direction(ply.x-camX(),ply.y-camY(),0,0));
topLeft[1]=lengthdir_y(point_distance(ply.x-camX(),ply.y-camY(),0,0),point_direction(ply.x-camX(),ply.y-camY(),0,0));
botRight[0]=lengthdir_x(point_distance(ply.x-camX(),ply.y-camY(),384,216),point_direction(ply.x-camX(),ply.y-camY(),384,216));
botRight[1]=lengthdir_y(point_distance(ply.x-camX(),ply.y-camY(),384,216),point_direction(ply.x-camX(),ply.y-camY(),384,216));
drawBlur(surf,fade,ply.x-camX(),ply.y-camY(),topLeft,botRight,blurFunc);