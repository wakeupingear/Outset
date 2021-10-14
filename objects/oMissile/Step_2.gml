///@description Animation
if global.alive
{
	particle(x+xDir*3+irandom_range(-2,2),y+yDir*3+irandom_range(-2,2),depth,sDeathCircle,0,{
		alpha:2,
		fade:0.07+irandom(1)*0.04,
		blend: trailBlend,
		xscale:0.02,
		yscale:0.02,
		xscaleSpd:0.005,
		yscaleSpd:0.005,
	});
}