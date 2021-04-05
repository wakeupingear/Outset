function roomChange(target_x,target_y,targetroom,transitionType,xmove,ymove,xscale){
	if !instance_exists(oTransition){
	global.transitioning=true;
	var _t=instance_create_depth(0,0,-10002,oTransition); //1 above dialogue
	_t.transition=transitionType;
	_t.move=xmove;
	_t.ymove=ymove;
	global.nextRoom=targetroom;
	
	if target_x==-1&&instance_exists(ply) global.plyX=ply.x;
	else global.plyX=target_x;
	if target_y==-1&&instance_exists(ply) global.plyY=ply.y;
	else global.plyY=target_y;
		
	with _t event_user(0);
	if instance_exists(ply)&&ply.state==moveState.ladder _t.ladder=true;
	if xscale!=0 _t.xscale=xscale;
	}
}