side=0;
cloudFadeTime=120;
alarm[0]=cloudFadeTime;

createMissile=function(xPos,yPos,angle,spd){
	if is_undefined(angle) angle=point_direction(xPos,yPos,ply.x,ply.y);
	if is_undefined(spd) spd=3;
	var _g=instance_create_layer(xPos,yPos,"people",oMissile);
	_g.startOffscreen=true;
	_g.scope=true;
	_g.spd=spd;
	_g.image_angle=angle;
	_g.image_index=0;
	return _g;
}