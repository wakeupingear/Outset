/// @description Draw
if preset==1 //wastes
{
	var _a=controller.image_alpha;
	if instance_exists(oTerrain) _a=(1-oTerrain.deathDist/oTerrain.deathDistMax);
	if (room!=rWastesBorder) image_alpha=min(_a+global.alive,1.1);
	stepNum=18.0-((room_height-camY())/216);
}

if global.alive fogTime=(fogTime+spd)%1;
ppFog(spr,x,y,image_xscale,image_yscale,image_alpha,image_blend,stepNum,fogTime,false);