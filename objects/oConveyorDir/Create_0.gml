event_inherited();

setDirection=function(){
	var _cond=hasData("conveyorDir");
	spd*=(_cond?-1:1);
	if !_cond image_blend=c_red;
	else image_blend=c_blue;
	image_blend=merge_color(image_blend,c_white,0.4);
}
setDirection();