function particle(x,y,depth,sprite,ind,struct){
	var _objInd=oParticle;
	if variable_struct_exists(struct,"distort") _objInd=oParticleDistort;
	var _p=instance_create_depth(x,y,depth,_objInd);
	_p.sprite_index=sprite;
	_p.image_index=ind;
	setObjFromStruct(_p,struct);
	if variable_struct_exists(struct,"isHit") 
	{
		_p.isHit=struct.isHit;
		if _p.isHit
		{
			_p.visible=false;
			if instance_exists(oTerrain) ds_list_add(oTerrain.terrain,_p);
		}
	}
	return _p;
}

function circularParticle(x,y,depth,struct){
	var _p=instance_create_depth(x,y,depth,oCircularParticle);
	setObjFromStruct(_p,struct);
	return _p;
}

function ghostTrail(x,y,frameOffset,depth,sprite,ind,struct){
	if global.roomTime%frameOffset==0
	{
		var _p=particle(x,y,depth,sprite_index,image_index,{alpha:0.75,fade:0.07});
		if !is_undefined(struct) setObjFromStruct(_p,struct);
	}
}