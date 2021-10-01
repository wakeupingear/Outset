/// @description Chunks
shake(3,3,15);
var _d=layer_get_depth("behind");
for (var i=destFrames[0];i<destFrames[1];i++)
{
	particle(partPos.x,partPos.y,0,sprite_index,i,{
		fade: 0,
		dir: (i-destFrames[0])/(destFrames[1]-destFrames[0])*360+45,
		isHit: true,
		spd: 4,
		alwaysMove: true,
		angSpd: 4,
		ghost: true,
		ghostFrameOffset:2,
		ghostDepth: _d
	});
}