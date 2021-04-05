/// @description Chunks
shake(3,3,15);
for (var i=destFrames[0];i<destFrames[1];i++)
{
	particle(partPos.x,partPos.y,0,sprite_index,i,{
		fade: 0,
		dir: (i-destFrames[0])/(destFrames[1]-destFrames[0])*360+45,
		isHit: true,
		spd: 4,
		alwaysMove: true,
		angSpd: 4
	});
}