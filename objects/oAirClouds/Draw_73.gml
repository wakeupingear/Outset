/// @description Draw fog
if global.alive fogTime=(fogTime+0.001)%1;

ppFog(sFogBigChunky,camX(),camY(),0.75,0.75,image_alpha,image_blend,15,fogTime,false);