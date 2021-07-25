/// @description Explode
explosionCircle(30,x,y,finalRad,0);
mask_index=sBarrelRadius;

if instance_exists(ply)&&point_distance(x,y,ply.x,ply.y)<finalRad hurtPlayer(1,"-","-");
shake(2,2,15);

var _b=id;
var _rad=finalRad;
destroyRadius(x,y,oBreakable,finalRad,true);
with enem if within(_b.x,_b.y,_b.finalRad) hurtEnem(id,1); //local variable scope hell :)