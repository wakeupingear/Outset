function createPopup(struct){
	var _parent=-1;
	if instance_exists(oPopup) with oPopup if mode>=0&&stackType!=1 _parent=id;
	
	if instance_exists(oPopup) var _o=instance_create_depth(0,0,instance_find(oPopup,0).depth-1,oPopup);
	else var _o=instance_create_layer(0,0,"highest",oPopup);
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
	if obj.interactable!=-1
	{
		if !instance_exists(oCursor) instance_create_depth(camX()+obj.interactable[0],camY()+obj.interactable[1],obj.depth-20,oCursor);
	}
	else if instance_exists(oCursor) instance_destroy(oCursor)
}