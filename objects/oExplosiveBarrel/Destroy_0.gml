/// @description Explode
explosionCircle(30,x,y,finalRad,0);
mask_index=sBarrelRadius;

if instance_exists(ply)&&distance_to_point(ply.x,ply.y)<finalRad hurtPlayer(1,"-","-");