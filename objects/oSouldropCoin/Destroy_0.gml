/// @description Save collection
if sprite_index==sSouldropCoin
{
	if staticCoin ds_list_add(global.souldropCollect,cID);
	global.souldrop+=value;
	checkSouldrop();
}

var _num=8;
for (var i=0;i<_num;i++)
{
	particle(x,y,depth,sPlaceholderPixelB,0,{
		dir: i*360/_num,
		spd: 1,
		xscale: 3,
		yscale: 3,
		alpha: 3.5,
		fade: 0.2
	});
}
shake(1,1,10);