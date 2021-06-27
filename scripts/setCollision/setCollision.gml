function setCollision(spr){
	if is_undefined(spr) spr=sprite_index;
	
	collType=npcHit;
	collPointX=[];
	collPointY=[];
	if !is_undefined(global.physCollPoints[?sprite_get_name(spr)]) //import the sprite's coordinates if it exists
	{
		collPointX=global.physCollPoints[?sprite_get_name(spr)][0];
		collPointY=global.physCollPoints[?sprite_get_name(spr)][1];
	}
}