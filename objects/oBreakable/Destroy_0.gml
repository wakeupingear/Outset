/// @description Drop surrounding stuff
dropSurroundingObj([0,-1]);

var _num=10;
for (var i=0;i<_num;i++)
{
	particle(xstart,ystart,depth,sPlaceholderPixelW,0,{
		dir: i*360/_num,
		spd: 2,
		xscale: 6,
		yscale: 6,
		alpha: 1.5,
		fade: 0.1
	});
}