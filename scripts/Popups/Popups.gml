function createPopup(struct){
	global.menuOpen=true;
	var _parent=-1;
	if instance_exists(oPopup) with oPopup if mode>=0&&stackType!=1 _parent=id;
	
	if instance_exists(oPopup) var _o=instance_create_depth(0,0,instance_find(oPopup,instance_number(oPopup)-1).depth-1,oPopup);
	else var _o=instance_create_depth(0,0,controller.depth-2,oPopup);
	setObjFromStruct(_o,struct);
	createPopupCursor(_o);
	
	if _parent!=-1
	{
		_o.below=_parent;
		_parent.stackType=1;
		_o.stackType=2;
	}
	return _o;
}

function createPopupCursor(obj){
	if obj.mouse!=-1
	{
		if !instance_exists(oCursor) instance_create_depth(camX()+obj.mouse[0],camY()+obj.mouse[1],obj.depth-200,oCursor);
	}
	else if instance_exists(oCursor) instance_destroy(oCursor)
}