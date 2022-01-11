/// @description Move objects
if (onlyAlive&&global.alive)||(onlyDead&&!global.alive){
	var _xC=lengthdir_x(spd,direction);
	var _yC=lengthdir_y(spd,direction);
	ds_list_clear(physList);
	instance_place_list(x,y,oPhysicsObj,physList,false);
	for (var i=0;i<ds_list_size(physList);i++){
		var _i=physList[|i];
		_i.hsp+=_xC;
		_i.vsp+=_yC;
	}
	if instance_exists(oGrapple)&&oGrapple.state==1&&place_meeting(x,y,oGrapple) {
		grappleTime++;
		oGrapple.x+=_xC*grappleTime;
		oGrapple.y+=_yC*grappleTime;
	}
	else grappleTime=0;
}