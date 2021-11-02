function animateProperty(obj,property,twerptype,startPos,endPos,step,onlyAlive,destroyOPTIONAL){
	var _p=oEffectHelper
	if !instance_exists(_p) _p=instance_create_depth(0,0,0,oEffectHelper);
	if is_undefined(destroyOPTIONAL) destroyOPTIONAL=false;
	ds_list_add(_p.lerpList,[obj,property,twerptype,startPos,endPos,startPos,step,onlyAlive,destroyOPTIONAL]);
}