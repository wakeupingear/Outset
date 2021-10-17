/// @description Chunks
var _d=layer_get_depth(layer_get_id("behind"));
for (var i=destFrames[0];i<destFrames[1];i++)
{
	var _p=particle(partPos.x,partPos.y,0,sprite_index,i,{
		falling: true,
		fade: 0,
		dir: (i-destFrames[0])/(destFrames[1]-destFrames[0])*360+irandom_range(-22,22),
		isHit: true,
		spd: 2+irandom(1),
		alwaysMove: true,
		angSpd: round((destFrames[1]-destFrames[0])/(i-destFrames[0])),
		blend: c_grey,
		ghost: true,
		ghostAlwaysMove: true,
		ghostDepth: _d
	});
}