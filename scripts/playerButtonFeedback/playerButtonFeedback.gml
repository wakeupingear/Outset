function playerButtonFeedback(obj){
	if isObj(obj,ply) shake(1,1,10);
	if image_angle==180 impulse("hsp",3,obj);
	else if image_angle==90 impulse(-2,-1,obj);
	else if image_angle==270 impulse(2,-1,obj);
	else impulse("hsp",-3,obj);
}