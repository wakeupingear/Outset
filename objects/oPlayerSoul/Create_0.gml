global.plyX=x;
global.plyY=y;
event_inherited();
image_alpha=1;
xscale=1;

while groundCollision(x,y) y--;

if !instance_exists(oPlayerCam) instance_create_depth(global.plyX,global.plyY,-10000,oPlayerCam);