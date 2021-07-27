/// @description Bind to player
npcMovementVars();
npcAnimVars();
facePlayer=false;
text=[];
x=ply.x;
y=ply.y;
xscale=ply.xscale;
yscale=ply.yscale;
hsp=ply.hsp;
vsp=ply.vsp;
animation=ply.animation;
stateToAnim=ply.stateToAnim;

pathfinding=true;
moveCommand="";
started=false;

image_speed=0;