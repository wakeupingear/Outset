function setInteractText(label,obj){
	global.interactText=label;
	if is_undefined(obj) global.interactTextObj=object_index;
	else global.interactTextObj=obj;
}