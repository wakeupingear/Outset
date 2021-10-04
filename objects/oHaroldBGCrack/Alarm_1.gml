/// @description 
shake(3,3,10);
for (var i=0;i<25;i++)
{
	var _p=particle(0,0,depth,asset_get_index("sHaroldBGCrack"+string(i)),i,{
		dir: round(i/25*360),
		spd:6,
		angSpd:((i mod 2)-!(i mod 2))*2
	});
	_p.x+=(sprite_get_xoffset(_p.sprite_index));
	_p.y+=(sprite_get_yoffset(_p.sprite_index));
}

instance_destroy(oLadder);
instance_destroy(oHaroldTrapdoor);
instance_destroy(npcHarold);
instance_destroy();