/// @description Draw
if preset==1 //wasets
{
	var _a=controller.image_alpha;
	if instance_exists(oTerrain) _a=(1-oTerrain.deathDist/oTerrain.deathDistMax);
	image_alpha=min(_a+global.alive,1.1);
	stepNum=18.0-((room_height-camY())/216)*2;
}

if global.alive fogTime+=0.0004;
ppFog(sFogBigChunky,x,y,image_xscale,image_yscale,image_alpha,image_blend,stepNum,fogTime,false);