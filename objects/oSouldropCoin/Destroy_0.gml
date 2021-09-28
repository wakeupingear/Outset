/// @description Save collection
if sprite_index==sSouldropCoin
{
	if staticCoin ds_list_add(global.souldropCollect,cID);
	else addDataPair(cID,hasData(cID)-1);
	global.souldrop+=value;
	checkSouldrop();
}

var _num=8;
for (var i=0;i<_num;i++)
{
	particle(x,y,depth,sPlaceholderPixelB,0,{
		dir: i*360/_num,
		spd: 1,
		xscale: 5,
		yscale: 5,
		alpha: 3,
		fade: 0.15
	});
}
particle(x,y,depth+1,sNormalRipple,0,{distort: true,xscale:0.05,yscale:0.05,xscaleSpd:0.015,yscaleSpd:0.015,fade:0.025});
shake(1,1,10);