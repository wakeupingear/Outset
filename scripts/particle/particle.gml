function particle(x,y,depth,sprite,ind,struct){
	var _p=instance_create_depth(x,y,depth,oParticle);
	_p.sprite_index=sprite;
	_p.image_index=ind;
	if variable_struct_exists(struct,"alpha") _p.image_alpha=struct.alpha;
	if variable_struct_exists(struct,"dir") _p.direction=struct.dir;
	if variable_struct_exists(struct,"spd") _p.spd=struct.spd;
	if variable_struct_exists(struct,"fade") _p.fade=struct.fade;
	if variable_struct_exists(struct,"falling") _p.falling=struct.falling;
	if variable_struct_exists(struct,"alwaysMove") _p.alwaysMove=struct.alwaysMove;
	if variable_struct_exists(struct,"angSpd") _p.angSpd=struct.angSpd;
	if variable_struct_exists(struct,"blend") _p.image_blend=struct.blend;
	if variable_struct_exists(struct,"isHit") 
	{
		_p.isHit=struct.isHit;
		if _p.isHit
		{
			_p.visible=false;
			if instance_exists(oTerrain) ds_list_add(oTerrain.terrain,_p);
		}
	}
	return _p
}