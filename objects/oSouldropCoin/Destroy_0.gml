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
		xscale: 4,
		yscale: 4,
		alpha: 3,
		fade: 0.15
	});
}
shake(1,1,10);