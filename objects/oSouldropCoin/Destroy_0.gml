/// @description Save collection
if sprite_index==sSouldropCoin
{
	if staticCoin ds_list_add(global.souldropCollect,cID);
	else addDataPair(cID,hasData(cID)-1);
	global.souldrop+=value;
	checkSouldrop();
}

collectParticle(sPlaceholderPixelB);
particle(x,y,depth+1,sNormalRipple,0,{distort: true,xscale:0.05,yscale:0.05,xscaleSpd:0.015,yscaleSpd:0.015,fade:0.025});
shake(1,1,10);