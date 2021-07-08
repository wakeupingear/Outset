/// @description Respawn
alarm[0]=-1;
yRemoved=0;
y=ystart;
touch=false;

if instance_exists(ply) with ply while groundCollision(x,y) y--;