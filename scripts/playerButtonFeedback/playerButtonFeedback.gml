function playerButtonFeedback(obj){
	if object_is_ancestor(obj.object_index,ply) shake(1,1,10);
	if image_yscale==1 impulse("hsp",-3,obj);
	else impulse("hsp",2,obj);
}