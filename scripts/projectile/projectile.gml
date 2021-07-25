function projectile(xPos,yPos,depth,struct){
	var _p=instance_create_depth(xPos,yPos,depth,oProjectile);
	_p.parentObj=id;
	setObjFromStruct(_p,struct);
	return _p;
}